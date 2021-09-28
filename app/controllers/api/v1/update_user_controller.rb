class Api::V1::UpdateUserController < ApplicationController
    def update
        userId = UserInformation.where(id:params[:id])
        ids = userId[0].user_id
        user = User.where(id:ids)
        if user.update(user_params)
          update_request(user, params[:id])
        else
          render json: {
            messages: user.errors.full_messages,
            is_success: false,
            data: {}
          }, status: :unprocessable_entity
        end
      end
  
      private
  
      def update_request(user, id)
        information = UserInformation.where(id:id)
        if information.update(user_information)
          render json: { messages: "okey"}, status: :ok
        else
          render json: { messages: information.errors.full_messages}, status: :unprocessable_entity
        end
      end
  
      def user_params
        params.require(:user).permit(:password, :password_confirmation, :user_type)
      end

      
      def user_information
        params.require(:information).permit(:full_name, :corporate_id, :user_rols_id)
      end
end

