class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = t "access_denied"
    redirect_to root_path
  end

  private
  def namespace
    controller_name_segments = params[:controller].split("/")
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join("/").camelize
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, namespace)
  end
end
