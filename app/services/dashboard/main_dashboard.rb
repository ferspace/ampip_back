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
                return {"widgets":["developers":rescue_corporate(0, 1), "sponsors":rescue_corporate(0, 0)], "user_information":user_information, "permissions":user_permissions}
            elsif type == "user_ampip"
                return {"widgets":["developers":rescue_corporate(0, 1), "sponsors":rescue_corporate(0, 0)], "user_information":user_information, "permissions":user_permissions}
            elsif type == "admin_society"
                return {"widgets":["developers":rescue_corporate(user_information),"sponsors":false], "user_information":user_information, "permissions":user_permissions}
            elsif type == "user_society"
                debugger
            elsif type == "admin_propiety"
                debugger
            end
        end

        #rescata los o el desarrollador dependiendo de el requerimiento donde type  (0 => patrocinadores o 1 => desarrolladores)
        def rescue_corporate(id, type = nil)
            if id == 0
                return Corporate.where(corporate_type: type)
            else
                if id == "Sin datos"
                    return "Sin Desarrollador asignado"
                else 
                    return Corporate.where(id: id.corporate_id)
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
    end 
end