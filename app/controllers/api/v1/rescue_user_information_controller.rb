class Api::V1::RescueUserInformationController < ApplicationController

    def show
        dataUser = UserInformation.joins(:user).where(users: {id: params[:id]})
        render json: dataUser
    end

end