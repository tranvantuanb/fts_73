class AddSlugToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :slug, :string
    add_index  :exams, :slug
  end
end
