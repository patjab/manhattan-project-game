class NationQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :nation
end
