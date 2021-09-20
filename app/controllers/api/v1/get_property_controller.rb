class Api::V1::GetPropertyController < ApplicationController
    

    def index
        property = PropertyInformations.joins(:property).where( property_informations:{status:2})
        render json: property
    end

    
end
