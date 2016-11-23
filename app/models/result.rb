class Result < ApplicationRecord
  belongs_to :exam, class_name: Exam.name
  belongs_to :question, class_name: Question.name
  belongs_to :answer, class_name: Answer.name
end
