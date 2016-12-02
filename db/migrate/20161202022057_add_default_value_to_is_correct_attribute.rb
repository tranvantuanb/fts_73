class AddDefaultValueToIsCorrectAttribute < ActiveRecord::Migration[5.0]
  def up
    change_column :answers, :is_correct, :boolean, default: false
  end

  def down
    change_column :answers, :is_correct, :boolean, default: nil
  end
end
