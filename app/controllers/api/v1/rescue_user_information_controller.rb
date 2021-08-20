class Api::V1::RescueUserInformationController < ApplicationController

    def show
        dataUser = UserInformation.joins(:user).where(users: {id: params[:id]})
        if dataUser[0] != nil
            corporate = Corporate.where(id: dataUser[0].id)
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

end