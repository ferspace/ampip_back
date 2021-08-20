class Api::V1::RescueUserInformationController < ApplicationController

    def index
        dataUser = UserInformations::CreateUserInfo.new(rescue_params).call
        render json:{"response":dataUser}
    end

end