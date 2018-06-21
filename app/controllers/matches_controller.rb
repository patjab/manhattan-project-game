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
    @match = Match.find(params[:id])
    @team = team_count(current_user, @match)

    @espionage = espionage_ability?(@match, current_user)

    @random_q = find_or_generate_random_question(@match)
    @match.update(current_question_id: @random_q.id)
  end

  def evaluate
    @match = Match.find(params[:id])
    @random_q = Question.find(@match.current_question_id)
    @espionage = espionage_ability?(@match, current_user)

    if params[:question][:option] == @random_q.answer # If correct answer is chosen
      UserQuestion.create(question: @random_q, user: current_user, match_id: @match.id)
      @match.is_challenger?(current_user) ? (@match.challenger_strikes = 0) : (@match.challenged_strikes = 0)
    else
      @match.is_challenger?(current_user) ? (@match.challenger_strikes += 1) : (@match.challenged_strikes += 1)
    end

    @match.update(current_turn_user_id: @match.the_other_user(current_user).id, current_question_id: nil)
    @team = team_count(current_user, @match)
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
  def team_count(current_user, match)
    team = Hash.new
    team["mathematician"] = current_user.user_questions.where(match_id: @match.id).select {|uq| uq.question.person.name == "Mathematician"}.count
    team["physicist"] = current_user.user_questions.where(match_id: @match.id).select {|uq| uq.question.person.name == "Physicist"}.count
    team["chemist"] = current_user.user_questions.where(match_id: @match.id).select {|uq| uq.question.person.name == "Chemist"}.count
    team["politician"] = current_user.user_questions.where(match_id: @match.id).select {|uq| uq.question.person.name == "Politician"}.count
    team
  end

  def espionage_ability?(match, current_user)
    (match.is_challenger?(current_user) && match.challenged_strikes > 2) || (match.is_challenged?(current_user) && match.challenger_strikes > 2)
  end

  def find_or_generate_random_question(match)
    (match.current_question_id && Question.find(match.current_question_id)) || Question.random_question(current_user)
  end
end
