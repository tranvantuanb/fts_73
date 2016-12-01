class Admin::QuestionsController < ApplicationController
  before_action :require_admin
  layout "admin"

  def index
    @subjects = Subject.all
    @questions = Question.all
  end
end
