class Api::V1::TenantUsersController < ApplicationController

    def index 
        tenantUsers = TenantUser.all
        render json: tenantUsers
    end

    def show
        tenantUsers_info = TenantUser.find(params[:id])
        render json: tenantUsers_info, each_serializer: Api::V1::TenantUserSerializer
    end 

    def create
        newTenantUser = TenantUser.new permit_params
        if newTenantUser.save
            render json:{"message":TenantUser.last[:id]}
        else
            render json:{"message":newTenantUser.errors.full_messages}
        end
    end

    def update
        updateTenantUser = TenantUser.find(params[:id])
        if updateTenantUser.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateTenantUser.errors.full_messages}
        end
    end

    def destroy

    end 

    private 

    def permit_params
        params.require(:tenant_user).permit(:property, :name_bussines, :country, :product_badge, :ID_SCIAN, :ID_DENUE, :antiquity, :superficie)
    end

end 
