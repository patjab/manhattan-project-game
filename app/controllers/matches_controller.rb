class MatchesController < ApplicationController
  before_action :authorized

  def new
    @match = Match.new
    @potential_match_users = (User.all - current_user.challengeds - current_user.challengers - [current_user])
  end

  def index
    @challengeds = current_user.challengeds
    @challengers = current_user.challengers
    @potential_match_users = User.all - @challengeds - @challengers - [current_user]
  end

  def show
    @correctness_msg = nil
    @match = Match.find(params[:id])
    if @match.total_num_of_team_players(current_user) > 15
      @winner = current_user
      @loser = @match.the_other_user(current_user)
      render :'winner.html'
    end

    if @match.total_num_of_team_players(@match.the_other_user(current_user)) > 15
      @winner = @match.the_other_user(current_user)
      @loser = current_user
      render :'loser.html'
    end

    @team = @match.team_count(current_user)
    @espionage = @match.espionage_ability?(current_user)
    @random_q = @match.find_or_generate_random_question(current_user)
    @espionage_on_you = @match.espionage_on_you?(current_user)
    @espionage_on_opponent = @match.espionage_on_you?(@match.the_other_user(current_user))
    @match.update(current_question_id: @random_q.id)
    @message = messages[@match.total_num_of_team_players(current_user)]
  end

  def evaluate
    @match = Match.find(params[:id])
    @random_q = Question.find(@match.current_question_id)
    @espionage = @match.espionage_ability?(current_user)
    @espionage_on_you = @match.espionage_on_you?(current_user)
    @message = messages[@match.total_num_of_team_players(current_user)]
    @correctness_msg = nil

    if params[:question][:option] == @random_q.answer # If correct answer is chosen
      @correctness_msg = true
      if @match.team_count(current_user)[@random_q.person.name.downcase] < 4
        UserQuestion.create(question: @random_q, user: current_user, match_id: @match.id)
      end

      if @espionage_on_you
        if @match.is_challenger?(current_user)
          # Reset the opponents' strikes and the espionage status
          @match.challenger_strikes = 0
          @match.espionage_on_challenger = false
        else
          @match.challenged_strikes = 0
          @match.espionage_on_challenged = false
        end
        @match.save
      end

      # @match.is_challenger?(current_user) ? (@match.challenger_strikes = 0) : (@match.challenged_strikes = 0)
    else # get it wrong
      @correctness_msg = false
      if !@espionage_on_you # no espionage
        @match.is_challenger?(current_user) ? (@match.challenger_strikes += 1) : (@match.challenged_strikes += 1)
      else # there is espionage
        uq = UserQuestion.where(match_id: @match.id, user_id: current_user.id).select {|uq| @random_q.person == uq.question.person}.last # needs base cases
        uq ? uq.update(user: @match.the_other_user(current_user)) : nil # switch the last team member from that respective category
        if @match.is_challenger?(current_user)
          # Reset the opponents' strikes and the espionage status
          @match.challenger_strikes = 0
          @match.espionage_on_challenger = false
        else
          @match.challenged_strikes = 0
          @match.espionage_on_challenged = false
        end
        @match.save

      end
    end

    @match.update(current_turn_user_id: @match.the_other_user(current_user).id, current_question_id: nil)
    @team = @match.team_count(current_user)
    render :'show.html'
  end

  def create
    @match = Match.new
    potential_match_users = User.all - current_user.challengeds - current_user.challengers - [current_user]

    challenged = User.find_by(user_name: params[:match][:challenged])
    if !challenged.nil? && potential_match_users.include?(challenged)
      created_match = Match.create(challenger: current_user, challenged: challenged)
      created_match.choose_first_user
      redirect_to matches_path
    else
      render :'new.html'
    end
  end

  def espionage_on
    @match = Match.find(params[:id])
    opponent = @match.the_other_user(current_user)
    @match.is_challenger?(opponent) ? (@match.espionage_on_challenger = true) : (@match.espionage_on_challenged = true)
    @match.save
    redirect_to match_path(@match)
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path(current_user)
  end

  private
  def messages
    [ "1919 - RESEARCH - You have discovered the proton by changing the form of nitrogen into oxygen",
      "1929 - RESEARCH - You have built the cyclotron",
      "1931 - RESEARCH - You have discovered the neutron",
      "1932 - RESEARCH - You have split an atom thereby proving the theory of relativity",
      "1933 - INVESTIGATING - Eureka! You realize it's possible to make a bomb by releasing energy through a chain reaction of neutrons colliding into nuclei",
      "1939 - INVESTIGATING - At a conference, you present the world a Theory of Nuclear Fission",
      "1939 - INVESTIGATING - Concerned about the discovery of fission you have written a leader to your country's prime minister.",
      "1941 - INVESTIGATING - You discover plutonium",
      "1941 - BUILDING - Your prime minister asks you to begin construction on the bomb",
      "1942 - BUILDING - You begin building reactors to produce plutonium and electromagnetic, centrifuge and gaseous diffusion plants to produce uranium-235",
      "1942 - BUILDING - You choose a site to build a bomb laboratory.  Codename: Project #{current_user.user_name}",
      "1942 - BUILDING - You have successfully created the first controlled chain reaction of uranium fission.",
      "1943 - TESTING - Bomb design begins",
      "1945 - TESTING - Plutonium reaches your bomb site",
      "1945 - TESTING - Demonstrate implosion compression in full scale test",
      "1945 - TESTING - Begin assembly of The Trinity Test Gadget"
    ]
  end
end
