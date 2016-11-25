class ChangeTypeSpentTimeToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :exams, :spent_time, :datetime
  end
end
