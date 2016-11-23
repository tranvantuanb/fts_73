class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :int
  end
end
