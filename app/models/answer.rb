class Answer < ApplicationRecord
  has_many :results, class_name: Result.name, foreign_key: :answer_id
  belongs_to :question, class_name: Question.name

  validate :content, presence: true, length: {maximum: Settings.content_size_max}
  validate :is_correct, inclusion: {in: [true, false]}
end
