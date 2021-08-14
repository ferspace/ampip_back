class Api::V1::DashboardController < ApplicationController
    before_action :session_user
    def index
        dashboard = Dashboard::MainDashboard.new(@current_user).call
        render json:{"message":dashboard}
    end

    private
    def session_user
        userConsult=User.find_by(authentication_token:request.headers["Authorization"])
        if userConsult != nil
            @current_user = userConsult
        else
            @current_user = 0
        end
        
    end
end