class Api::V1::RescueUserInformationController < ApplicationController

    def show
        dataUser =  UserInformation.joins(:user).where(user_informations: {id:params[:id]})
        if dataUser[0] != nil
            corporate = Corporate.where(id: dataUser[0].corporate_id)
            users = User.where(id: dataUser[0].user_id)
            if corporate[0] != nil
                render json: {"user": dataUser[0],"informacion": users.first, "corporate": corporate[0]}
            else 
                render json: dataUser, status: :ok
            end
        else
            render json: {}, status: 404
        end
    end

    def destroy
        id = params[:id]
        userInfo = UserInformation.where(id: id)
        if userInfo != nil
            user = userInfo[0].user_id
           if UserInformation.delete(id)
                if User.delete(user)
                    render json: {message: "Eliminado"}
                end
           end
        end
    end


end