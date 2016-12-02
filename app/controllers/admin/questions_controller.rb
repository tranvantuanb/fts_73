class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @subjects = Subject.all
    @questions = Question.all.page params[:page]
  end
end
