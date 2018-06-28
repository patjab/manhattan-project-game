# The User class will only contain the methods relating to determining what the
# user has, and editing what the user has (awarding, and poaching)

class User < ApplicationRecord
  has_secure_password

  has_many :challenger_matches, class_name: 'Match', foreign_key: 'challenged_id'
  has_many :challengers, class_name: 'User', through: :challenger_matches, foreign_key: 'challenger_id'

  has_many :challenged_matches, class_name: 'Match', foreign_key: 'challenger_id'
  has_many :challengeds, class_name: 'User', through: :challenged_matches, foreign_key: 'challenged_id'

  has_many :user_questions
  has_many :questions, through: :user_questions
  has_many :people, through: :questions

  validates :user_name, uniqueness: true
  validates :user_name, :length => { :in => 6..20 }
  validates :user_name, presence: true
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..20}, :on => :create
  validates :password, :confirmation => true, :length => {:within => 6..20}, :allow_blank => true, :on => :update

  def team_roaster(match = nil)
    team = Hash.new
    filter = match ? ("match_id = #{match.id}") : ("id IS NOT NULL")
    Person.all.each {|person| team[person.name] = self.user_questions.where(filter).select {|uq| uq.question.person.name == person.name}.count }
    team
  end

  def total_team_members(match = nil)
    match.nil? ? self.user_questions.count : (self.user_questions.where(match_id: match.id).count)
  end

  def award_the_question(match, question)
    self.team_roaster(match)[question.person.name] < 4 ? (UserQuestion.create(question: question, user: self, match: match)) : nil
  end

  def poach_from_opponent(match, person)
    opponent = match.the_other_user(self)
    uq = opponent.user_questions.where(match_id: match.id).select {|uq| person == uq.question.person}.last
    uq ? (self.team_roaster(match)[person.name] < 4 ? uq.update(user: self) : uq.destroy) : nil
  end

  def process_response(match, question, response)
    question.correct_response?(response) ? process_correct_response(match, question) : process_wrong_response(match, question)
    question.correct_response?(response)
  end

  def random_challengers(repeat_users, limit = nil)
    potential_challengeds = repeat_users ? (User.all - [self]) : (User.all - [self] - self.challengeds - self.challengers)
    limit.nil? ? (limit = potential_challengeds.length) : nil
    display_potential_challengeds = []
    while potential_challengeds.length > 0 && display_potential_challengeds.length < limit
      random_i = rand(potential_challengeds.length)
      display_potential_challengeds << potential_challengeds[random_i]
      potential_challengeds.delete_at(random_i)
    end
    display_potential_challengeds
  end

  def all_matches
    (self.challenger_matches + self.challenged_matches).sort { |x,y| y.created_at <=> x.created_at }
  end

  def active_matches
    all_matches.select { |match| match.accepted }
  end

  def pending_matches
    all_matches.select { |match| !match.accepted }
  end

  def has_pending_matches?
    self.pending_matches.count != 0
  end

  private
  def process_correct_response(match, question)
    self.award_the_question(match, question)
    !match.espionage_on_you?(self) ? nil : match.espionage_over(self)
    true
  end

  def process_wrong_response(match, question)
    if !match.espionage_on_you?(self)
      match.add_strike(self)
    else
      match.the_other_user(self).poach_from_opponent(match, question.person)
      match.espionage_over(self)
    end
    false
  end
end
