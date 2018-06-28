class MatchesController < ApplicationController
  before_action :authorized
  before_action :preserve_turn_statefulness, only: [:show, :evaluate, :espionage_on, :pending, :decide_to_accept]

  def new
    @match = Match.new
    @display_potential_challengeds = current_user.random_challengers(true, 5)
  end

  def index
    @message = params[:message]
    @active_matches = current_user.active_matches
    @pending_matches = current_user.pending_matches
  end

  def pending
    @match.accepted ? redirect_to(matches_path) : nil
  end

  def decide_to_accept
    if params[:accepted] == "true"
      @match.update(accepted: true)
      redirect_to match_path(@match)
    else
      @match.destroy
      redirect_to matches_path
    end
  end

  def show
    !@match.accepted ? redirect_to(pending_path(id: params[:id])) : nil
    current_user != @match.challenger && current_user != @match.challenged ? redirect_to(matches_path) : nil
    @match.winner_of_match ? (render :'finished.html') : nil
    @team = current_user.team_roaster(@match)
    @espionage_on_opponent = @match.espionage_on_you?(@opponent)
    @match.update(current_question_id: @question.id)
    @message = Stage.as_readable_array[current_user.total_team_members(@match)]
  end

  def evaluate
    @message = Stage.as_readable_array[current_user.total_team_members(@match)]
    @correctness_msg = current_user.process_response(@match, @question, params[:question][:option])
    @match.update(current_turn_user_id: @opponent.id, current_question_id: nil)
    @team = current_user.team_roaster(@match)
    render :'show.html'
  end

  def create
    @match = Match.new
    @display_potential_challengeds = current_user.random_challengers(true, 5)
    challenged = User.find_by(user_name: params[:match][:challenged])
    if !challenged.nil? && current_user.random_challengers(true).include?(challenged)
      created_match = Match.create(challenger: current_user, challenged: challenged, accepted: false)
      created_match.choose_first_user
      redirect_to matches_path
    else
      render :'new.html'
    end
  end

  def espionage_on
    @match = Match.find(params[:id])
    @match.is_challenger?(@opponent) ? (@match.espionage_on_challenger = true) : (@match.espionage_on_challenged = true)
    @match.save
    redirect_to match_path(@match)
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path(current_user)
  end

  private
  def preserve_turn_statefulness
    @match = Match.find(params[:id])
    @question = @match.find_or_generate_random_question(current_user)
    @espionage = @match.espionage_ability?(current_user)
    @espionage_on_you = @match.espionage_on_you?(current_user)
    @opponent = @match.the_other_user(current_user)
    @correctness_msg = nil
  end
end
