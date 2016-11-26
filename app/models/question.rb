class Question < ApplicationRecord
  has_many :results, class_name: Result.name, foreign_key: :question_id
  has_many :answers, class_name: Answer.name, foreign_key: :question_id,
    dependent: :destroy, inverse_of: :question
  belongs_to :user, class_name: User.name
  belongs_to :subject, class_name: Subject.name

  validates :content, presence: true, length: {maximum: Settings.content_size_max}
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc{|attributes| attributes["content"].blank?}

  scope :search, -> content{Question.where("content LIKE ?","%#{content}%")}
end
