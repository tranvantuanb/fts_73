class Api::QuestionsController < ApplicationController

  def index
    if params[:subject_id].blank?
      @questions = Question.all
    else
      subject = Subject.find_by id: params[:subject_id]
      @questions = subject.questions
    end

    respond_to do |format|
      format.html{render partial: "/admin/questions/questions",
        locals: {questions: @questions}
      }
    end
  end
end
