class Api::V1::SearchImageController < ApplicationController

    def show
        property = PropertyInformations.where(property_id:params[:id])
        render property
    end 

end