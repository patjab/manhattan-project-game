class Match < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'

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
end
