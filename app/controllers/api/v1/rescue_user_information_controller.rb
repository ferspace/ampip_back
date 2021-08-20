class Api::V1::RescueUserInformationController < ApplicationController

    def show
        dataUser = UserInformation.joins(:user).where(users: {id: params[:id]})
        n = dataUser.merge!(User.find(params[:id]))
        render json: n
    end

end