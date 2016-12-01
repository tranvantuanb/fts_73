class Exam < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  enum status: [:start, :testing, :uncheck, :checked]
  belongs_to :user, class_name: User.name
  belongs_to :subject, class_name: Subject.name
  has_many :results, class_name: Result.name, dependent: :destroy
  has_many :questions, through: :results

  accepts_nested_attributes_for :results

  after_create :create_result
  scope :exams_per_month, -> {
    where(created_at: Time.now.all_month()) }
  scope :score_greater_than, -> score {
    where(created_at: Time.now.all_month()).count
  }
  paginates_per 10

  def caculate_score
    score = 0
    self.results.each do |result|
      unless result.answer.nil?
        score += 1 if result.answer.is_correct?
      end
    end
    score
  end

  def slug_candidates
    [
      [:id, self.subject.name]
    ]
  end

  def self.statistic_score
    scores = Exam.all.map(&:score)
    statistic_score = []
    (0..Subject.maximum(:question_number)).each do |n|
      statistic_score << (Exam.where(score: n).count * 100 / (Exam.count * 1.0)).round(2)
    end
    statistic_score
  end

  private
  def create_result
    subject.questions.sample(subject.question_number).each do |question|
      self.results.create question_id: question.id
    end
  end
end
