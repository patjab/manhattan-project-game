class MatchesController < ApplicationController
  before_action :authorized
  #before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def new
    @match = Match.new
  end

  def index
    @challengeds = current_nation.challengeds
    @challengers = current_nation.challengers
    @potential_match_nations = Nation.all - @challengeds - @challengers - [current_nation]
  end

  def show
    @match = Match.find(params[:id])
    # If it is their turn
    if current_nation == Nation.find(@match.current_turn_nation_id)
      # Generate a random question if none exists
      if @match.current_question_id.nil?
        @random_q = Question.random_question(current_nation)
        @match.current_question_id = @random_q.id
        @match.save
      # Or keep the one that does
      else
        @random_q = Question.find(@match.current_question_id)
      end
      render :'show.html'
    # If it is not their turn
    else
      render :'wait.html'
    end
  end

  # This method switch the current nations in the current_turn_nation_id
  # spot as well as reset the question
  def wrong
    # params[:format] will take in whatever is passed into the path
    @match = Match.find(params[:format])
    @match.current_turn_nation_id = @match.the_other_nation(current_nation).id
    @match.current_question_id = nil
    @match.save
    render :'wait.html'
  end

  def correct
    # Person will now be associated with the user through a question
    # along with following the same procedures for step change coded in
    # #wrong
  end

  def create
    @match = Match.new
    potential_match_nations = Nation.all - current_nation.challengeds - current_nation.challengers - [current_nation]

    challenged = Nation.find_by(nation_name: params[:match][:challenged])
    if !challenged.nil? && potential_match_nations.include?(challenged)
      created_match = Match.create(challenger: current_nation, challenged: challenged)
      created_match.choose_first_nation
      redirect_to matches_path
    else
      render :'new.html'
    end
  end

end
