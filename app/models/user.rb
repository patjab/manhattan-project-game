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


  #validates :user_name, :format => { :with => /^(?![0-9]*$)[a-zA-Z0-9]+$/ }
  #validates :password, with: [/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/]
end
