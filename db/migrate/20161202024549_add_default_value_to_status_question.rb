class AddDefaultValueToStatusQuestion < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :status, :integer, default: 0
  end

  def down
    change_column :questions, :status, :integer, default: nil
  end
end
