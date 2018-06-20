class AddColumnCounterStrikesForWrongQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :challenger_strikes, :integer, :default => 0
    add_column :matches, :challenged_strikes, :integer, :default => 0
  end
end
