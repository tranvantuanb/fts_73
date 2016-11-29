class ExamsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :update_status, only: [:show]

  def index
    @subjects = Subject.all
    @exams = current_user.exams.order(created_at: :desc).page params[:page]
    @exam = Exam.new
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

  def update
    spent_time = ((Time.now - @exam.updated_at).to_i)*1000
    duration_time = @exam.subject.duration*60*1000
    params[:exam][:spent_time] = spent_time > duration_time ? duration_time : spent_time
    params[:exam][:status] = :uncheck

    if @exam.update_attributes exam_params
      ExamWorker.perform_async
      redirect_to exams_path
    else
      flash[:danger] = t(".update_faild")
      redirect_to exams_path
    end
  end

  def show
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id, :spent_time, :status,
      results_attributes: [:id, :answer_id, :_destroy]
  end

  def update_status
    @exam.update_attributes status: :testing if @exam.start?
  end
end
