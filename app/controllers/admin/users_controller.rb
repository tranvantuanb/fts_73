class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @users = User.order(:name).page params[:page]
  end

  def destroy
    @user = User.friendly.find params[:id]
    if @user && @user.destroy
      flash[:success] = t ".destroy_success",
        objects: t("activerecord.model.user")
    else
      flash[:danger] = t ".destroy_error",
        objects: t("activerecord.model.user")
    end
    redirect_to admin_users_url
  end
end
