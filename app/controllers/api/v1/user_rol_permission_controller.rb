class Api::V1::UserRolPermissionController < ApplicationController
    before_action :session_user

    def index
        userRolPermission = UserRolPermission.all
        render json: userRolPermission, each_serializer: Api::V1::UserRolPermissionSerializer
    end

    def show
        userRolPermission_info = UserRolPermission.find(params[:id])
        render json: userRolPermission_info, each_serializer: Api::V1::UserRolPermissionSerializer
    end

    def create
        newUserRolPermission = UserRolPermission.new permit_params
        if newUserRolPermission.save
            render json:{"message":"guardado"}
        else
            render json:{"message":newUserRolPermission.errors.full_messages}
        end
    end

    def update
        updateUserRolPermission = UserRolPermission.find(params[:id])
        if updateUserRolPermission.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateUserRolPermission.errors.full_messages}
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
            params.require(:user_rol).permit(:permission_id,:user_rol_id,:read,:write)
        end
end
