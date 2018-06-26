class UserQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_one :match, through: :user

  def match
    Match.find(match_id)
  end

  def match=(match)
    self.match_id = match.id
  end
end
