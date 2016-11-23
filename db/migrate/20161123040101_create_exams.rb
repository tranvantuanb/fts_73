class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :status

      t.timestamps
    end
  end
end
