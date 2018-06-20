class Match < ApplicationRecord
  belongs_to :challenger, class_name: 'Nation'
  belongs_to :challenged, class_name: 'Nation'

  # Roll the dice
  def choose_first_nation
    nations = [self.challenger, self.challenged]
    self.current_turn_nation_id = nations[rand(0..1)].id
    self.save
  end

  def the_other_nation(nation)
    self.challenger == nation ? self.challenged : self.challenger
  end
end
