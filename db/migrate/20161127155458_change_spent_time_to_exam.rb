class ChangeSpentTimeToExam < ActiveRecord::Migration[5.0]
  def up
    change_column :exams, :spent_time, :integer, default: 0
  end

  def down
    change_column :exams, :spent_time, :datetime
  end
end
