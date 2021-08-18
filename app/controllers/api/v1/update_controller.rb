class Api::V1::UpdateController < ApplicationController

    def index
        render json: {message: 'Not found'}, status: 404
    end

    def show
        propertyInformation_info = PropertyInformations.where(id:params[:id])
        if propertyInformation_info.present?
            render json: propertyInformation_info, each_serializer: Api::V1::PropertyInformationSerializer
        else
            render json: { message: 'Not found' }, status: 404
        end
    end

    def update
        updatePropertyInformation = PropertyInformations.find(params[:id])
        if updatePropertyInformation.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updatePropertyInformation.errors.full_messages}
        end
    end

    private
    def permit_params
        params.require(:property_information).permit(:property_id, :name, :tipo, :superficie, :address, :english_name, :park_property, :region, :market, :industry, :suprficie_total, :superficie_urbanizada, :superficie_disponible, :inicio_de_operaciones, :number_employe, :practices_recognition, :infrastructure, :navy_number, :message, :postal_code, :colony, :municipality, :state, :status, :unity, :lat, :lng)
    end

end
