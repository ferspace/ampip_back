class Api::V1::UserExtraController < ApplicationController
    

    def update
        userInfo = UserInformation.where(user_id:params[:id])
        if UserInformation.delete(userInfo[0].id)
            if User.delete(params[:id])
                render json:{"message":"eliminado"}
            end
        else
            render json:{"message":"errror"}
        end        
    end
    
    def get_user_by_corporate
        contacts = UserInformation.joins(:user).where(user_informations:{corporate_id:params[:id]})
        render json: {contacts: contacts}
    end

end
