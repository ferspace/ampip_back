class Api::V1::PropietiesController < ApplicationController
    before_action :session_user

    def index 
        propieties = Corporativo::CrearPertenencia.new(@current_user, params).Property
        
        render json: propieties, each_serializer: Api::V1::PropertySerializer
    end 

    def show 
        propieties_info = Property.find(params[:id])
        render json: propieties_info, each_serializer: Api::V1::PropertySerializer
    end 

    def create
        newPropieties = Property.new permit_params
        if newPropieties.save
            render json:{"data":newPropieties[:id]}
        else
            render json:{"message":newPropieties.errors.full_messages}
        end
    end

    def update
        updateProperties = Property.find(params[:id])
        if updateProperties.update(permit_params)
            render json:{"data":updateProperties}
        else
            render json:{"message":updateProperties.errors.full_messages}
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
            params.require(:propieties).permit(:corporate_id,:tipo, :nombre)
        end

    
end
