class Exam < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :subject, class_name: Subject.name
  has_many :results, class_name: Result.name, dependent: :destroy

  validate :status, presence: true
end
