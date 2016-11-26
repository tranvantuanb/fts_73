class Exam < ApplicationRecord
  enum status: [:start, :testing, :uncheck, :checked]
  belongs_to :user, class_name: User.name
  belongs_to :subject, class_name: Subject.name
  has_many :results, class_name: Result.name, dependent: :destroy

  after_create :create_result

  private
  def create_result
    subject.questions.sample(subject.question_number).each do |question|
      self.results.create question_id: question.id
    end
  end
end
