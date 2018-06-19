class CreateNations < ActiveRecord::Migration[5.2]
  def change
    create_table :nations do |t|
      t.string :nation_name
      t.string :password_digest

      t.timestamps
    end
  end
end
