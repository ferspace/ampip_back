class Api::V1::SearchImageController < ApplicationController

    def show
        property = PropertyInformations.where(id:params[:property_id])
        render property
    end 

end