class Admin::LogsController < ApplicationController
  before_action :require_admin
  layout "admin"

  def index
  end
end
