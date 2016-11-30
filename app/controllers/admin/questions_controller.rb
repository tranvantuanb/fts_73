class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :require_admin
  layout "admin"

  def index
    @subjects = Subject.all
    @questions = Question.all
  end
end
