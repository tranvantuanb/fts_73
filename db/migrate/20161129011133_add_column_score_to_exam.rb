class AddColumnScoreToExam < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :score, :integer, default: 0
  end
end
