class Api::V1::UpdateUserController < ApplicationController
    def update
        userId = UserInformation.where(id:params[:id])
        ids = userId[0].user_id
        user = User.where(id:ids)
        if user.update(user_params)
          render json: {messages: "Listo"}
        else
          render json: {
            messages: user.errors.full_messages,
            is_success: false,
            data: {}
          }, status: :unprocessable_entity
        end
      end
  
      private
  
      def update_request(user)
        information = UserInformation.where(user_id:user.id)
        if information.update(user_information)
          render json: { messages: "update Successfully", is_success: true, is_client: user.user_type, data: {user: user}
        }, status: :ok
        else
          render json: { messages: information.errors.full_messages, is_success: false, data: {}
          }, status: :unprocessable_entity
        end
      end
  
      def user_params
        params.require(:user).permit(:password, :password_confirmation, :user_type)
      end

      
      def user_information
        params.require(:information).permit(:full_name, :corporate_id, :user_rols_id)
      end
end

