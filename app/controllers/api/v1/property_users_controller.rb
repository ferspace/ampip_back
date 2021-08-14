class Api::V1::PropertyUsersController < ApplicationController

    def index 
      propertyUsers = PropertyUser.all
      render json: propertyUsers, each_serializer: Api::V1::PropertyUserSerializer
    end

    def show
        propertyUsers_info = PropertyUser.find(params[:id])
        render json: propertyUsers_info, each_serializer: Api::V1::PropertyUserSerializer
    end

    def create 
        newPropertyUsers = PropertyUser.new permit_params
        if newPropertyUsers.save
            render json:{"message":"guardado"}
        else
            render json:{"message":"error"}
        end
    end 

    def update
        updateContact = PropertyUser.find(params[:id])
        if updateContact.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateContact.errors.full_messages}
        end
    end

    def destroy

    end

    private

    def permit_params
        params.require(:property_user).permit(:id, :user_id, :property_id, :type_property)
    end

end
