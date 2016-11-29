class Admin::ExamsController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @subjects = Subject.all
    @exams = Exam.all.order(updated_at: :desc).page params[:page]
  end

  def show
  end

  def update
    params[:score] = @exam.caculate_score
    params[:status] = :checked
    if @exam.update_attributes exam_params
      ResultWorker.perform_async @exam.id
      redirect_to admin_exams_path
    else
      flash[:danger] = t(".update_faild")
      redirect_to admin_exams_path
    end
  end

  private
  def exam_params
    params.permit :status, :score
  end
end
