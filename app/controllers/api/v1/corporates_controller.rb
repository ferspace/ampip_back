class Api::V1::CorporatesController < ApplicationController
    before_action :session_user

    def index 
        # corporates = Corporate.where(corporate_type: params[:type])
        # render json: corporates, each_serializer: Api::V1::CorporatesSerializer
        corporate = Corporativo::CrearPertenencia.new(@current_user, params).call
        render json: corporate, each_serializer: Api::V1::CorporatesSerializer
    end

    def show
        corporate_info = Corporate.find(params[:id])
        render json: corporate_info, each_serializer: Api::V1::CorporatesSerializer
    end 

    def create
        newCorporate = Corporate.new permit_params
        if newCorporate.save
            render json:{"message":Corporate.last[:id]}
        else
            render json:{"message":newCorporate.errors.full_messages}
        end
    end

    def update
        updateCorporate = Corporate.find(params[:id])
        if updateCorporate.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":0}
        end
    end

    
    def seeOut
        id = params[:id]
        deleted = Corporate.where(id:id)
        if deleted.update(status:false)
            render json: {"message":"eliminado"}
        else
            render json: {"message":deleted.errors.full_messages}
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
            params.require(:corporate).permit(:id,:name,:english_name,:social_type,:address,:postal_code,:colony,:state,:municipality,:cel,:anual_invetsment,:previus_anual_inv,:next_anual_inv,:downt_date,:corporate_type,:status,:cel_lada, :cel_code, :ext_num, :int_num )
        end
end
