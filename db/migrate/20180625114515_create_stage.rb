class CreateStage < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.integer :year
      t.string :stage
      t.string :message
    end
  end
end
