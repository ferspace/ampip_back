class Api::V1::TestController < ApplicationController

    def index
        dataUser = UserInformations::CreateUserInfo.new(rescue_params).call
        render json:{"response":dataUser}
    end

    private 

    def rescue_params
        params.require(:user_info).permit(:id, :user_id, :full_name, :last_name, :address, :state, :office_address, :charge, :date_of_birth, :phone_office, :cel, :corporate_id, :status, :municipality, :colony, :postal_code_number, :user_type_permision_id, :user_type, :created_at, :updated_at)
    end
    #provado y listo 
    def corporateX
        corps = Corporate.all
        return corps
    end

    #provado y listo
    def contactX 
        return Contact.all
    end

    #provado y listo
    def corporateInfoX
        return CorporateInformation.all
    end

    #provado y listo
    def mapsX
        return Map.all
    end

    #provado y listo
    def permissionX
        return Permission.all
    end

    #provado y listo
    def property
         return Property.all
    end

    #provado y listo
    def propertyInfoX
        return PropertyInformation.all
    end
    #probado y listo
    def propertyUserX
        return PropertyUser.all
    end
    #probado y listo
    def statusDisponibility
        return StatusDisponibility.all 
    end

    #probado y listo
    def tenantHistory
        return TenantHistory.all
    end
    
    #probado y listo
    def tenantUser
        return TenantUser.all
    end

    #probado y listo
    def userChanges
        return UserChange.all
    end
end