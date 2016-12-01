class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:member, :admin]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, class_name: Question.name, foreign_key: :user_id
  has_many :exams, class_name: Exam.name, foreign_key: :user_id,
    dependent: :destroy

  def slug_candidates
    [
      :name,
      [:name, :email]
    ]
  end
end
