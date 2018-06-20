class MatchesController < ApplicationController
  before_action :authorized
  #before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @challengeds = current_nation.challengeds
    @challengers = current_nation.challengers
    @potential_match_nations = Nation.all - @challengeds - @challengers - [current_nation]
  end

  def show
    @match = Match.find(params[:id])
    @random_q = Question.random_question(current_nation)
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new
    potential_match_nations = Nation.all - current_nation.challengeds - current_nation.challengers - [current_nation]
    # NO CASE SENSITIVITY

    challenged = Nation.find_by(nation_name: params[:match][:challenged])
    if !challenged.nil? && potential_match_nations.include?(challenged)
      Match.create(challenger: current_nation, challenged: challenged)
      redirect_to matches_path
    else
      render :'new.html'
    end
  end
end
