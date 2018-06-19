class Question < ApplicationRecord
  has_many :nation_questions
  has_many :nations, through: :nation_questions

  belongs_to :person
end
