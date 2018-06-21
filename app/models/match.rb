class Match < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'

  has_many :questions, through: :challengers
  has_many :people, through: :questions

  # Roll the dice
  def choose_first_user
    users = [self.challenger, self.challenged]
    self.current_turn_user_id = users[rand(0..1)].id
    self.save
  end

  def the_other_user(user)
    self.challenger == user ? self.challenged : self.challenger
  end

  def is_challenger?(user)
    user == self.challenger
  end

  def is_challenged?(user)
    user == self.challenged
  end

  # def team_count(current_user)
  #   team = Hash.new
  #   team["mathematician"] = current_user.user_questions.where(match_id: self.id).select {|uq| uq.question.person.name == "Mathematician"}.count
  #   team["physicist"] = current_user.user_questions.where(match_id: self.id).select {|uq| uq.question.person.name == "Physicist"}.count
  #   team["chemist"] = current_user.user_questions.where(match_id: self.id).select {|uq| uq.question.person.name == "Chemist"}.count
  #   team["politician"] = current_user.user_questions.where(match_id: self.id).select {|uq| uq.question.person.name == "Politician"}.count
  #   team
  # end
end
