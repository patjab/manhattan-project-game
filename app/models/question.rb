class Question < ApplicationRecord
  has_many :user_questions
  has_many :users, through: :user_questions

  belongs_to :person

  # Gets a random question that was not answered correctly previously
  # Think about bound cases for this as well
  # I will go back to this to resolve the case when we run out of questions
  def self.random_question(user)
    q = nil
    #loop do
      q = Question.all[rand(Question.all.count)]
      #break if !user.questions.include?(q)
    #end
    q
  end

  def sorted_hash_of_options
    {
      self.option_a => false,
      self.option_b => false,
      self.option_c => false,
      self.option_d => false,
      self.answer => true
    }.select { |key, value| !key.nil? }
  end

  def hash_of_options
    result = Hash.new
    options = sorted_hash_of_options.keys
    while options.length > 0
      result[options.delete_at(rand(0...options.length))] = false
    end
    result
  end

  def correct_response?(response)
    self.answer == response
  end
end
