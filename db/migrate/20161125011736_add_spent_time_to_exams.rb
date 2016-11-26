class AddSpentTimeToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :spent_time, :time
  end
end
