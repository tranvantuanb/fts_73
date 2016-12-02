class ChangeStatusTypeInQuestions < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :status, :boolean, default: "false"
  end

  def down
    change_column :questions, :status, :integer, default: 0
  end
end
