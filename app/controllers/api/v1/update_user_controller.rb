class Api::V1::UpdateUserController < ApplicationController
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
  
      private
  
      def update_request(user)
        information = user.user_information
        if information.update(user_information)
          render json: { messages: "update Successfully", is_success: true, is_client: user.user_type, data: {user: user}
        }, status: :ok
        else
          render json: { messages: "update Failded", is_success: false, data: {}
          }, status: :unprocessable_entity
        end
      end
  
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
      end

      
      def user_information
        params.require(:information).permit(:full_name, :corporate_id, :user_rols_id)
      end
end

