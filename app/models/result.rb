class Result < ApplicationRecord
  belongs_to :exam, class_name: Exam.name, optional: true
  belongs_to :question, class_name: Question.name, optional: true
  belongs_to :answer, class_name: Answer.name, optional: true
end
