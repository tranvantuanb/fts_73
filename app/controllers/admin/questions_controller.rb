class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  before_action :load_subjects, except: [:destroy]

  def index
    @questions = Question.all.page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.check_is_correct && @question.check_answers_quantity &&
      @question.save
      flash[:success] = t ".create_success"
      redirect_to admin_questions_url
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t ".update_success"
      redirect_to admin_questions_url
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question && @question.destroy
      flash[:success] = t ".destroy_success",
        objects: t("activerecord.model.question")
    else
      flash[:danger] = t ".destroy_error",
        objects: t("activerecord.model.question")
    end
    redirect_to admin_questions_url
  end

  private
  def question_params
    params.require(:question).permit :id, :content, :user_id, :subject_id,
      :status, answers_attributes: [:id, :content, :is_correct]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
