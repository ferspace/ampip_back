class Api::V1::CorporateImageController < ApplicationController
    #before_action :session_user

    def show
        corporate_image = CorporateInformation.where(corporate_id:params[:id])
        render json: corporate_image
    end

   

end
