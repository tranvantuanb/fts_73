class User < ApplicationRecord
  has_many :questions, class_name: Question.name, foreign_key: :user_id
  has_many :exams, class_name: Exam.name, foreign_key: :user_id,
    dependent: :destroy

  attr_accessor :remember_token
  validates :name , presence: true, length: {maximum: Settings.name_size_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.password_min},
    allow_nil: true
end
