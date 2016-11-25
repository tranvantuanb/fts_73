class ExamsController < ApplicationController

  def index
    @subjects = Subject.all
    @exams = current_user.exams
  end

  def create
    @exam  = current_user.exams.build exam_params
    if @exam.save
      flash[:success] = t ".create_exam_successful"
      redirect_to exams_path
    else
      flash[:danger] = t ".create_faild"
      redirect_to exams_path
    end
  end

  private
  def exam_params
    params.permit :subject_id
  end

end
