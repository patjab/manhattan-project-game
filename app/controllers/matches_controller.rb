class MatchesController < ApplicationController
  before_action :authorized
  #before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def new
    @match = Match.new
  end

  def index
    @challengeds = current_user.challengeds
    @challengers = current_user.challengers
    @potential_match_users = User.all - @challengeds - @challengers - [current_user]
  end

  def show
    @team = team_count(current_user)
    @match = Match.find(params[:id])
    # If it is their turn

    @espionage = espionage_ability?(@match, current_user)

    # Generate a random question if none exists
    if @match.current_question_id.nil?
      @random_q = Question.random_question(current_user)
      @match.current_question_id = @random_q.id
      @match.save
    # Or keep the one that does
    else
      @random_q = Question.find(@match.current_question_id)
    end
  end

  # This method switch the current users in the current_turn_user_id
  # spot as well as reset the question
  def wrong
    # params[:format] will take in whatever is passed into the path
    @match = Match.find(params[:format])
    @espionage = espionage_ability?(@match, current_user)
    @match.current_turn_user_id = @match.the_other_user(current_user).id
    @match.current_question_id = nil
    @match.is_challenger?(current_user) ? (@match.challenger_strikes += 1) : (@match.challenged_strikes += 1)
    @match.save

    @team = team_count(current_user)
    render :'show.html'
  end

  def correct
    # Person will now be associated with the user through a question
    # along with following the same procedures for step change coded in
    # #wrong
    @match = Match.find(params[:format])
    @espionage = espionage_ability?(@match, current_user)

    uq = UserQuestion.new
    uq.question = Question.find(@match.current_question_id)
    uq.user = current_user
    uq.save

    @match.current_turn_user_id = @match.the_other_user(current_user).id
    @match.current_question_id = nil
    @match.is_challenger?(current_user) ? (@match.challenger_strikes = 0) : (@match.challenged_strikes = 0)
    @match.save

    @team = team_count(current_user)
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


  private
  def team_count(current_user)
    team = Hash.new
    team["mathematician"] = current_user.people.where(name: "Mathematician").count
    team["physicist"] = current_user.people.where(name: "Physicist").count
    team["chemist"] = current_user.people.where(name: "Chemist").count
    team["politician"] = current_user.people.where(name: "Politician").count
    team
  end

  def espionage_ability?(match, current_user)
    (match.is_challenger?(current_user) && match.challenged_strikes > 2) || (match.is_challenged?(current_user) && match.challenger_strikes > 2)
  end
end
