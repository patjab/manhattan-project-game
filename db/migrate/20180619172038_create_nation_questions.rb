class CreateNationQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :nation_questions do |t|
      t.integer :question_id
      t.integer :nation_id

      t.timestamps
    end
  end
end
