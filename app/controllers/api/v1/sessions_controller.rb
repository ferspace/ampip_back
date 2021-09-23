class Api::V1::SessionsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  # sign in
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user
      rules = Permissions::RescuePermission.new(@user[:id]).rescues
      render json: { 
        messages: "Signed In Successfully",
        is_success: true,
        is_client: @user.user_type,
        data: {user: @user, permissions: rules}
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :ok
    end
  end

  private
  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }
    end
  end
end
