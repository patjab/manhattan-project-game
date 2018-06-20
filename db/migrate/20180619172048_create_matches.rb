class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :challenger_id
      t.integer :challenged_id
      t.boolean :accepted
      t.integer :current_turn_nation_id

      t.timestamps
    end
  end
end
