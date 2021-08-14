class Api::V1::TenantHistoriesController < ApplicationController

    def index
        tenantHistories = TenantHistory.all
        render json: tenantHistories, each_serializer: Api::V1::TenantHistorySerializer
    end

    def show
        tenantHistories_info = TenantHistory.find(params[:id])
        render json: tenantHistories_info, each_serializer: Api::V1::TenantHistorySerializer
    end

    def create
        newTenantHistories = TenantHistory.new permit_params
        if newTenantHistories.save
            render json:{"message":"guardado"}
        else 
            render json:{"message":newTenantHistories.errors.full_messages}
        end  
    end

    def update
        updateTenantHistories = TenantHistory.find(params[:id])
        if updateTenantHistories.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateTenantHistories.errors.full_messages}
        end
    end

    def destroy

    end

    private

    def permit_params
         params.require(:tenant_histories).permit(:property_id, :tenant_user_id)
    end


    
end
