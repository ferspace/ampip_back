class Api::V1::PermissionsController < ApplicationController
    before_action :session_user

    def index 
        permissions = Permission.all
        render json: permissions, each_serializer: Api::V1::PermissionsSerializer
    end

    def show
        user_info = Permission.find(params[:id])
        render json: user_info, each_serializer: Api::V1::PermissionsSerializer
    end

    def create 
        newPermissions =  Permission.new permit_params
        if newPermissions.save
            render json:{"message":"guardado"}
        else
            render json:{"message":newPermissions.errors.full_messages}
        end
    end

    def update
        updatePermissions = Permission.find(params[:id])
        if updatePermissions.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updatePermissions.errors.full_messages}
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
            params.require(:permission).permit(:id,:name,:description,:tipo)
        end
end
