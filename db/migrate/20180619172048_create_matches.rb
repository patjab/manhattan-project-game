class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.belongs_to :challenger, foreign_key: true
      t.belongs_to :challenged, foreign_key: true
      t.boolean :accepted
      t.integer :current_turn_nation_id

      t.timestamps
    end
  end
end
