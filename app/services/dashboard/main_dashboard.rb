module Dashboard
    class MainDashboard
        def initialize(params)
            @params = params
        end
  
        def call
            if @params != 0 && @params != nil
                type = @params[:user_type]
                
                user_information = rescue_user_information(@params[:id])[0]
                if user_information != 0
                    user_permissions = Permissions::RescuePermission.new(user_information[:user_rols_id]).call
                    return dashboard(type, user_information, user_permissions)
                    #return user_information
                else
                    return "Sin informacion de usuario"
                end
            else
                return "Token invalido"
            end
        end

        private 
        def dashboard(type,user_information, user_permissions)
            if type == "admin_ampip"
                return {"widgets":["developers":rescue_corporate(0, 0), "sponsors":rescue_corporate(0, 1)], "user_information":user_information, "permissions":user_permissions, "allUser":all_user, "allChanges":all_changes, "allProperties":allProperties, "rescueParks":rescue_parks}
            elsif type == "user_ampip"
                return {"widgets":["developers":rescue_corporate(0, 0), "sponsors":rescue_corporate(0, 1)], "user_information":user_information, "permissions":user_permissions, "rescueParks":rescue_parks, "allProperties":allProperties,"allUser":all_user}
            elsif type == "admin_society"
                return {"widgets":["developers":rescue_corporate(user_information),"sponsors":false], "user_information":user_information, "permissions":user_permissions, "rescueParks":rescue_parks, "allProperties":allProperties,"allUser":all_user}
            elsif type == "user_society"
                return {"widgets":["developers":rescue_corporate(user_information),"sponsors":false], "user_information":user_information, "permissions":user_permissions, "rescueParks":rescue_parks, "allProperties":allProperties,"allUser":all_user}
            elsif type == "admin_propiety"
                return {"widgets":["developers":rescue_corporate(user_information),"sponsors":false], "user_information":user_information, "permissions":user_permissions, "rescueParks":rescue_parks, "allProperties":allProperties,"allUser":all_user}
            else 
                return {"widgets":["developers":false,"sponsors":rescue_corporate(user_information)], "user_information":user_information, "permissions":user_permissions, "rescueParks":rescue_parks, "allProperties":allProperties,"allUser":all_user}
            end
        end
        #cambio
        #rescata los o el desarrollador dependiendo de el requerimiento donde type  (0 => patrocinadores o 1 => desarrolladores)
        def rescue_corporate(id, type = nil)
            if id == 0
                return Corporate.where(corporate_type: type, status:true)
            else
                if id == "Sin datos"
                    return "Sin Desarrollador asignado"
                else 
                    return Corporate.where(id: id.corporate_id, status:true)
                end    
            end
        end
        #obtiene la informacion del usuario
        def rescue_user_information(id)
            @user = UserInformation.where(user_id:id)
            if @user != []
                return @user
            else
                return [0]
            end
        end     
        
        def all_user
            return UserInformation.all
        end

        def all_changes
            return PropertyInformations.where(status:0)
        end

        def allProperties
            if @user = UserInformation.where(user_id:@params[:id])[0]
                if @params[:user_type] == "admin_ampip" || @params[:user_type] == "user_ampip"
                    return {
                        "parques": PropertyInformations.joins(:property).where(property:{tipo:0}, property_informations:{status:1, tipo:0}).or(PropertyInformations.where(property:{tipo:0}, property_informations:{status:2, tipo:0})),
                        "naves": PropertyInformations.joins(:property).where(property:{tipo:1}, property_informations:{status:1}).or(PropertyInformations.where(property:{tipo:1}, property_informations:{status:2})),
                        "terrenos": PropertyInformations.joins(:property).where(property:{tipo:2}, property_informations:{status:1}).or(PropertyInformations.where(property:{tipo:2}, property_informations:{status:2})),
                        "nav": PropertyInformations.joins(:property).where(property:{tipo:0}, property_informations:{tipo:1, status:1}).or(PropertyInformations.where(property:{tipo:0}, property_informations:{tipo:1, status:1})),
                        "ter": PropertyInformations.joins(:property).where(property:{tipo:0}, property_informations:{tipo:2, status:1}).or(PropertyInformations.where(property:{tipo:0}, property_informations:{tipo:2, status:1}))
                    }
                end
            else
                return {
                        "parques": PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id],  tipo:0}, property_informations:{status:1}).or(PropertyInformations.where(property:{corporate_id:@user[:corporate_id],  tipo:0}, property_informations:{status:2})),
                        "naves": PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id], tipo:1}, property_informations:{status:1}).or(PropertyInformations.where(property:{corporate_id:@user[:corporate_id], tipo:1}, property_informations:{status:2})),
                        "terrenos": PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id], tipo:2}, property_informations:{status:1}).or(PropertyInformations.where(property:{corporate_id:@user[:corporate_id], tipo:2}, property_informations:{status:2})),
                        "nav": PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id], tipo:0}, property_informations:{tipo:1, status:1}).or(PropertyInformations.where(property:{corporate_id:@user[:corporate_id], tipo:0}, property_informations:{tipo:1, status:2})),
                        "ter": PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id], tipo:0}, property_informations:{tipo:2, status:1}).or(PropertyInformations.where(property:{corporate_id:@user[:corporate_id], tipo:0}, property_informations:{tipo:2, status:2}))
                    }
            end
        end

        def rescue_parks
            @user = UserInformation.where(user_id:@params[:id])[0]
            if @user != []
                if @params[:user_type] == "admin_ampip" || @params[:user_type] == "user_ampip"
                    return PropertyInformations.joins(:property).where(property:{tipo:0},  property_informations:{status:1, tipo:0})
                else
                    return PropertyInformations.joins(:property).where(property:{corporate_id:@user[:corporate_id], tipo:0},  property_informations:{status:1, tipo:0})
                end
            else
                return [0]
            end
        end

    end 
end