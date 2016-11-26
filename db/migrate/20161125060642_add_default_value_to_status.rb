class AddDefaultValueToStatus < ActiveRecord::Migration[5.0]
  def up
    change_column :exams, :status, :integer, default: 0
  end

  def down
    change_column :exams, :status, :integer, default: 0
  end
end
