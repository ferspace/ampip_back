class Api::V1::RegistrationsController < ApplicationController
  
    def create
      user = User.new user_params
      if user.save
        render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          is_client: user.user_type,
          data: {user: user}
        }, status: :ok
      else
        render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
    end


    def update
      user = User.find(params[:id])
      if user.update(user_params)
        update_request(user)
      else
        render json: {
          messages: "update Failded",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
    end

    def dropingUsers 
        idUserInfo = UserInformation.where(user_id:params[:id])
        debugger
        UID = UserInformation.destroy()
    end

    private

    def update_request(user)
      information = user.user_information
      if information(user_information)
        render json: { messages: "update Successfully", is_success: true, is_client: user.user_type, data: {user: user}
      }, status: :ok
      else
        render json: { messages: "update Failded", is_success: false, data: {}
        }, status: :unprocessable_entity
      end
    end

    def user_information
      params.require(:user).permit(:full_name, :corporate_id, :user_rols_id)
    end
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
    end

    def ensure_params_exist
      return if params[:user].present?
      render json: {
          messages: "Missing Params",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
  end
