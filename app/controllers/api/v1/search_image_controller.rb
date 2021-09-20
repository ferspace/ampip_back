class Api::V1::SearchImageController < ApplicationController

    def show
        property = PropertyInformations.where(id:params[:id])
        render json: property
    end 

end