class Nation < ApplicationRecord
  has_secure_password
  
  has_many :matches
  # has_many :challengers, class_name: 'Nation', through: :matches, foreign_key: 'challenger_id'
  # has_many :challengeds, class_name: 'Nation', through: :matches, foreign_key: 'challenged_id'

  # NATION --< MATCH >-- NATION

  #has_many :challenger_matches, class_name: 'Match', foreign_key: 'challenger_id'
  has_many :challengers, class_name: 'Nation', through: :matches, foreign_key: 'challenger_id'

  #has_many :challenged_matches, class_name: 'Match', foreign_key: 'challenged_id'
  has_many :challengeds, class_name: 'Nation', through: :matches, foreign_key: 'challenged_id'

  has_many :nation_questions
  has_many :questions, through: :nation_questions
  has_many :people, through: :questions



end
