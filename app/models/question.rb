class Question < ApplicationRecord
  acts_as_paranoid
  has_many :results, class_name: Result.name, foreign_key: :question_id
  has_many :answers, class_name: Answer.name, foreign_key: :question_id,
    dependent: :destroy, inverse_of: :question
  belongs_to :user, class_name: User.name
  belongs_to :subject, class_name: Subject.name

  validates :content, presence: true, length: {maximum: Settings.content_size_max}
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc{|attributes| attributes["content"].blank?}
  paginates_per Settings.number_ten

  scope :search, -> content{Question.where("content LIKE ?","%#{content}%")}

  def check_is_correct
    valid = false
    self.answers.each do |ans|
      valid = true if ans.is_correct?
    end
    valid
  end

  def check_answers_quantity
    valid = false
    valid = true if self.answers.size < 6 && self.answers.size > 1
    valid
  end
end
