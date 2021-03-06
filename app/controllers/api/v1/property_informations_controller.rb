class Api::V1::PropertyInformationsController < ApplicationController
    before_action :session_user

    def index
        propertyInformations = PropertyInformations.where(status: 2)
        render json: propertyInformations, each_serializer: Api::V1::PropertyInformationSerializer
    end

    def update_publish
        updatePropertyInformation = PropertyInformations.where(id:params[:id][:id])
        if updatePropertyInformation.update(status: params[:status])
            response = Bilda::Content.new(params[:id][:id]).defineStatus
            if response
                render json:{"message":"status modificado"}
            else
                render json:{"message":"status modificado no publicado"}
            end
        else
            render json:{"message":updatePropertyInformation.errors.full_messages}
        end
    end

    def show
        propertyInformation_info = PropertyInformations.where(property_id:params[:id])
        if propertyInformation_info.present?
            render json: propertyInformation_info, each_serializer: Api::V1::PropertyInformationSerializer
        else
            render json: { message: 'Not found' }, status: 404
        end
    end

    def create
        newPropertyInformation = PropertyInformations.new permit_params
        if newPropertyInformation.save
            idProperty = newPropertyInformation[:id]
            #sube imagenes a bilda
            newStatus = createStatus(idProperty)#creaa el status disponible por defecto en falso
            if newStatus == true
                render json:{"message": idProperty}
            end
        else
            render json:{"message":newPropertyInformation.errors.full_messages}
        end
    end

    def update
        updatePropertyInformation = PropertyInformations.find(params[:id])
        if updatePropertyInformation.update(permit_params_update)
            
            render json:{"message":"guardado"}
        else
            render json:{"message":updatePropertyInformation.errors.full_messages}
        end
    end

    def IndustrilBuildingOnly
        if @current_user[:user_type] == "admin_ampip" || @current_user[:user_type] == "user_amip"
            properties = PropertyInformations.joins(:property).where(property_informations: {status: 1, tipo: 3})
            render json: properties, each_serializer: Api::V1::PropertyInformationSerializer
        else
            userInfo = UserInformation.where(user_id: @current_user[:id])
            if userInfo.present?
                corporate = userInfo[0][:corporate_id]
                properties = PropertyInformations.joins(:property).where({property_informations: {status: 1, tipo: 3 }, property: {corporate_id: corporate}}).or(PropertyInformations.joins(:property).where({property_informations: {status: 1},property: {corporate_id: corporate, tipo: 3}}))
                debugger
                render json: properties, each_serializer: Api::V1::PropertyInformationSerializer
            end
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
            params.require(:property_information).permit(:property_id, :name, :tipo, :superficie, :address, :english_name, :park_property, :region, :market, :industry, :suprficie_total, :superficie_urbanizada, :superficie_disponible, :inicio_de_operaciones, :number_employe, :practices_recognition, :infrastructure, :navy_number, :message, :postal_code, :colony, :municipality, :state, :status, :unity, :lat, :lng, :num_int, :num_ext, :phone, :lada, :code, :image, :type_use, :confidencial)
        end

        def permit_params_update
            params.require(:property_information).permit(:property_id, :name, :tipo, :superficie, :address, :english_name, :park_property, :region, :market, :industry, :suprficie_total, :superficie_urbanizada, :superficie_disponible, :inicio_de_operaciones, :number_employe, :practices_recognition, :infrastructure, :navy_number, :message, :postal_code, :colony, :municipality, :state, :status, :unity, :lat, :lng, :num_int, :num_ext, :phone, :lada, :code, :image, :type_use, :confidencial)
        end

        #crear registro en la tabla de disponibilidad
        def createStatus(id)
            newStatus = StatusDisponibility.new(status_property:false, property_informations_id: id, average_price: nil, use: "N/A")
            if newStatus.save
                return true
            else
                return false
            end
        end


end
