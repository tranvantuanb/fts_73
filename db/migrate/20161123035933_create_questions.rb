class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :subject_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
