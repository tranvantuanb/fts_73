class ExamMailer < ApplicationMailer

  def new_exam
    @admins = User.admin
    mail to: @admins.map(&:email).uniq, subject: "New exam"
  end

  def result_exam exam_id
    @exam = Exam.find_by id: exam_id
    @user = @exam.user
    mail to: @user.email, subject: "Result Achievement"
  end
end
