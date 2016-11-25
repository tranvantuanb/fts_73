class AddQuestionNumberToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :question_number, :integer
  end
end
