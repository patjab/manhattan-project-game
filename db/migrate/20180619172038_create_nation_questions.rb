class CreateNationQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :nation_questions do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :nation, foreign_key: true

      t.timestamps
    end
  end
end
