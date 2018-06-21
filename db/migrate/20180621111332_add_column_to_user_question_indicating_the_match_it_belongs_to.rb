class AddColumnToUserQuestionIndicatingTheMatchItBelongsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_questions, :match_id, :integer
  end
end
