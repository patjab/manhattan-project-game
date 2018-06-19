class Match < ApplicationRecord
  belongs_to :challenger, class_name: 'Nation'
  belongs_to :challenged, class_name: 'Nation'
end
