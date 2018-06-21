class AddColumnIndicatingCurrentQuestionToMatchesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :current_question_id, :integer
  end
end
