# The match class will contain only methods relating to match administration,
# including determining the identity of the players

class Match < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'

  has_many :questions, through: :challengers
  has_many :people, through: :questions

  def choose_first_user
    self.update(current_turn_user_id: [self.challenger, self.challenged][rand(0..1)].id)
  end

  def the_other_user(user)
    self.challenger == user ? self.challenged : self.challenger
  end

  def winner_of_match
    self.challenger.total_team_members(self) > 15 ? self.challenger : (self.challenged.total_team_members(self) > 15 ? self.challenged : nil)
  end

  def loser_of_match
    self.winner_of_match ? self.the_other_user(winner_of_match) : nil
  end

  def is_challenger?(user)
    user == self.challenger
  end

  def is_challenged?(user)
    user == self.challenged
  end

  def find_or_generate_random_question(user)
    (self.current_question_id && Question.find(self.current_question_id)) || Question.random_question(user)
  end

  def espionage_ability?(user)
    (self.is_challenger?(user) && self.challenged_strikes > 2) || (self.is_challenged?(user) && self.challenger_strikes > 2)
  end

  def espionage_on_you?(user)
    (self.is_challenger?(user) && self.espionage_on_challenger) || (self.is_challenged?(user) && self.espionage_on_challenged)
  end

  def add_strike(user)
    (self.is_challenger?(user) && self.challenger_strikes += 1) || (self.is_challenged?(user) && self.challenged_strikes += 1)
    self.save
  end

  def espionage_over(user)
    self.is_challenger?(user) ? self.update(challenger_strikes: 0, espionage_on_challenger: false) : self.update(challenged_strikes: 0, espionage_on_challenged: false)
  end
end
