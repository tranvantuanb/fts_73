class Subject < ApplicationRecord
  has_many :exams, class_name: Exam.name, foreign_key: :subject_id
  has_many :questions, class_name: Question.name, foreign_key: :subject_id

  validates :name, presence: true, length: {maximum: Settings.name_size_max}
end
