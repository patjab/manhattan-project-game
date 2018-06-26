class MatchesController < ApplicationController
  before_action :authorized
  before_action :establish_turn, only: [:show, :evaluate]

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
    check_for_a_winner
    @correctness_msg = nil
    @team = current_user.team_roaster(@match)
    @espionage_on_opponent = @match.espionage_on_you?(opponent)
    @match.update(current_question_id: @random_q.id)
    @message = Stage.as_readable_array[current_user.total_team_members(@match)]
  end

  def evaluate
    @message = Stage.as_readable_array[current_user.total_team_members(@match)]
    @correctness_msg = (params[:question][:option] == @random_q.answer ? current_user.process_correct_response(@match, @random_q) : current_user.process_wrong_response(@match, @random_q))
    @match.update(current_turn_user_id: opponent.id, current_question_id: nil)
    @team = current_user.team_roaster(@match)
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
  def check_for_a_winner
    @winner = @match.winner_of_match
    @loser = @match.loser_of_match
    @winner ? (render :'finished.html') : nil
  end

  def establish_turn
    @match = Match.find(params[:id])
    @random_q = @match.find_or_generate_random_question(current_user)
    @espionage = @match.espionage_ability?(current_user)
    @espionage_on_you = @match.espionage_on_you?(current_user)
  end

  def opponent
    @match.the_other_user(current_user)
  end
end
