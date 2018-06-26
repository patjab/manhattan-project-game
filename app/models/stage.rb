class Stage < ApplicationRecord
  def self.as_readable_array
    Stage.all.map {|stage| "#{stage.year.to_s} - #{stage.stage} - #{stage.message}" }
  end
end
