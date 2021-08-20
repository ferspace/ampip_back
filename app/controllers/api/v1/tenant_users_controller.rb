class Api::V1::TenantUsersController < ApplicationController

    def index 
        tenant = TenantUser.where(property_id: params[:id])
        render json: tenant
    end

    def show
        tenantUsers_info = TenantUser.find(params[:id])
        render json: tenantUsers_info, each_serializer: Api::V1::TenantUserSerializer
    end 

    def create
        getProps = Property.where(id: 1)
        if getProps != nil 
            newTenantUser = TenantUser.new(permit_params.merge(property_id: getProps[:id]))
            if newTenantUser.save
                render json:{"message":TenantUser.last[:id]}
            else
                render json:{"message":newTenantUser.errors.full_messages}
            end
        else
            render json:{"message":"Property not found"}
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

    def params_search_property
        params.require(:tenant_user).permit(:property_id)
    end

    def permit_params
        params.require(:tenant_user).permit(:property_id, :name_bussines, :country, :product_badge, :ID_SCIAN, :ID_DENUE, :antiquity, :superficie)
    end

    def rescue_tenant_user 
        tenant = []

        for i in 1..TenantUser.count
            tenant << TenantUser.find(i)
        end

        return tenant
    end
end 
