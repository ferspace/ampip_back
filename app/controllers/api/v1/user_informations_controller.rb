class Api::V1::UserInformationsController < ApplicationController
    before_action :session_user

    def index
        userInformation_info = UserInformation.all 
        render json: userInformation_info, each_serializer: Api::V1::UserInformationSerializer
    end

    def show
        userInformation_info = UserInformation.where(user_id: params[:id])
        
        render json: userInformation_info, each_serializer: Api::V1::UserInformationSerializer
    end

    def create
        newInformationUser = UserInformation.new(permit_params)
        if newInformationUser.save
            render json:{"data":newInformationUser}
        else
            debugger
            render json:{"message":newInformationUser.errors.full_messages}
        end
    end

    def update
        updateInformationUser = UserInformation.where(user_id:params[:id])
        if updateInformationUser.update(permit_params)
            render json:{"data":updateInformationUser}
        else
            render json:{"message":updateInformationUser.errors.full_messages}
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
            params.require(:information).permit(:user_id,:full_name,:last_name,:address,:state,:office_address,:charge,:date_of_birth,:phone_office,:cel,:corporate_id,:status,:municipality,:colony,:postal_code_number,:user_rols_id,:user_type,:created_at,:updated_at, :phone_office_lada, :phone_office_code)
        end
end
