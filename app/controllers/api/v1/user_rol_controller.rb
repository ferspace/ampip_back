class Api::V1::UserRolController < ApplicationController
    before_action :session_user

    def index
        userRol = UserRol.all
        render json: userRol, each_serializer: Api::V1::UserRolSerializer
    end

    def show
        userRol_info = UserRol.find(params[:id])
        render json: userRol_info, each_serializer: Api::V1::UserRolSerializer
    end

    def create
        newUserRol = UserRol.new permit_params
        if newUserRol.save
            render json:{"message":"guardado"}
        else
            render json:{"message":newUserRol.errors.full_messages}
        end
    end

    def update
        updateUserRol = UserRol.find(params[:id])
        if updateUserRol.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateUserRol.errors.full_messages}
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
            params.require(:user_rol).permit(:name,:children_id,:parent_id)
        end

end
