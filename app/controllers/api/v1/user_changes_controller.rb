class Api::V1::UserChangesController < ApplicationController

    def index
        userChanges = UserChange.all
        render json: userChanges, each_serializer: Api::V1::UserChangesSerializer
    end

    def show
        userChanges_info = UserChange.find(params[:id])
        render json: userChanges_info, each_serializer: Api::V1::UserChangesSerializer
    end

    def create
        newUserChanges = UserChange.new permit_params
        if newUserChanges.save
            render json:{"message":"guardado"}
        else 
            render json:{"message":"error"}
        end 
    end

    def update
        updateUserChanges = UserChange.find(params[:id])
        if updateUserChanges.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateUserChanges.errors.full_messages}
        end
    end

    def destroy

    end

    private

    def permit_params
         params.require(:user_changes).permit(:previews_value, :next_value, :message, :email, :user_id)
    end  
end
