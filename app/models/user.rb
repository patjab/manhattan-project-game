class User < ApplicationRecord
  has_secure_password

  has_many :challenger_matches, class_name: 'Match', foreign_key: 'challenged_id'
  has_many :challengers, class_name: 'User', through: :challenger_matches, foreign_key: 'challenger_id'

  has_many :challenged_matches, class_name: 'Match', foreign_key: 'challenger_id'
  has_many :challengeds, class_name: 'User', through: :challenged_matches, foreign_key: 'challenged_id'

  has_many :user_questions
  has_many :questions, through: :user_questions
  has_many :people, through: :questions
end
