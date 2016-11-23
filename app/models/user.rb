class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, class_name: Question.name, foreign_key: :user_id
  has_many :exams, class_name: Exam.name, foreign_key: :user_id,
    dependent: :destroy

end
