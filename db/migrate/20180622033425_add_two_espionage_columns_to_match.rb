class AddTwoEspionageColumnsToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :espionage_on_challenger, :boolean, :default => false
    add_column :matches, :espionage_on_challenged, :boolean, :default => false
  end
end
