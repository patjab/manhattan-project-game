class QuestionsController < ApplicationController
  # WE NEED TO STORE THE CURRENT QUESTIO IN THE DATABASE SO THAT WE DONT CONSTANTLY KEEP GENERATING RANDOM QUESTIONS

  # Roll the dice to determine which nation will go first
  # Set the current_turn_nation_id in the Match table to equal that nation's id at the moment
  # Indicate to each player there turn choice
  def initial
  end

  # Display the timeline progression, indicated by attributes in the match table WE NEED TO ADD THESE NEW ATTR THROUGH MIGRATIONS
  # Get a random question
  # Display the random question

  # Only enable the ESPIONAGE button when an opponent has answered 3 questions wrong in a row
  def progression
  end
end
