class Api::V1::CorporateInformationsController < ApplicationController
    before_action :session_user

    def index
        corporateInformations = CorporateInformation.all
        render json: corporateInformations, each_serializer: Api::V1::CorporatesInformationSerializer
    end

    def show
        corporateInformations_info = CorporateInformation.where(corporate_id: params[:id])
        render json: corporateInformations_info, each_serializer: Api::V1::CorporatesInformationSerializer
    end

    def create
        newCorporateInformation = CorporateInformation.new permit_params
        if newCorporateInformation.save
            render json:{"message":"guardado"}
        else
            render json:{"message":newCorporateInformation.errors.full_messages}
        end
    end

    def update
        updateCorporateInformation = CorporateInformation.find(params[:id])
        if updateCorporateInformation.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateCorporateInformation.errors.full_messages}
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
            params.require(:corporate_information).permit(:id,:rfc,:social_media_tw,:social_media_fb,:social_media_inst,:social_media_link,:social_media_web,:corporate_id)
        end
end
