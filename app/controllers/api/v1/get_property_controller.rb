class Api::V1::GetPropertyController < ApplicationController
    

    def index
        property = PropertyInformations.joins(:property).where( property_informations:{status:1})
        render json: property
    end

    
end
