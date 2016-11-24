class RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation,
      :address, :phone_number)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation,
      :address, :phone_number, :current_password)
  end
end
