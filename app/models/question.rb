class Question < ApplicationRecord
  has_many :nation_questions
  has_many :nations, through: :nation_questions

  belongs_to :person

  # Gets a random question that was not answered correctly previously
  # Think about bound cases for this as well
  # I will go back to this to resolve the case when we run out of questions
  def self.random_question(nation)
    q = nil
    loop do
      q = Question.all[rand(Question.all.count)]
      break if !nation.questions.include?(q)
    end
    q
  end
end
