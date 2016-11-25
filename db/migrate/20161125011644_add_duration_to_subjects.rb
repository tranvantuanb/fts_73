class AddDurationToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :duration, :time
  end
end
