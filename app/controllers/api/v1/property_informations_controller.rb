class Api::V1::PropertyInformationsController < ApplicationController
    before_action :session_user

    def index
        propertyInformations = PropertyInformations.all
        render json: propertyInformations, each_serializer: Api::V1::PropertyInformationSerializer
    end

    def show
        propertyInformation_info = PropertyInformations.find_by_id(params[:id])
        if propertyInformation_info != nil
            render json: propertyInformation_info, each_serializer: Api::V1::PropertyInformationSerializer
        else
            render json: { message: 'Not found' }, status: 404
        end
    end

    def create
        newPropertyInformation = PropertyInformations.new permit_params
        if newPropertyInformation.save
            render json:{"message":"guardado"}
        else
            render json:{"message":newPropertyInformation.errors.full_messages}
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

        def session_user
            @current_user=User.find_by(authentication_token:request.headers["Authorization"])
            if @current_user.present?
                return @current_user
            else
                render :json => {:error => "Token invalido"}.to_json, :status => 200
            end
        end

        def permit_params
            params.require(:property_information).permit(:property_id, :name, :tipo, :superficie, :address, :english_name, :park_property, :region, :market, :industry, :suprficie_total, :superficie_urbanizada, :superficie_disponible, :inicio_de_operaciones, :number_employe, :practices_recognition, :infrastructure, :navy_number, :message, :postal_code, :colony, :municipality, :state, :status, :unity, :lat, :lng)
        end

end
