module Corporativo
    class CrearPertenencia

        def initialize(user, params)
            @user = user
            @params = params
        end

        def call
            return rescue_id
        end

        def Property
            
            userInformation = UserInformation.find_by_user_id(@user[:id])
            if @user[:user_type] == "admin_ampip" || @user[:user_type] == "user_ampip"
                return  propertyes = Property.all
            else
                if userInformation[:corporate_id]
                    return propertyes = Property.where(corporate_id: userInformation[:corporate_id])
                end
            end
            
        end

        private

        def rescue_id
            userInformation = UserInformation.find_by_user_id(@user[:id])
            if @user[:user_type] == "admin_ampip" || @user[:user_type] == "user_ampip"
                return  corporates = Corporate.where(corporate_type: @params[:type], status:true)
            else
                if userInformation[:corporate_id]
                    return corporates = Corporate.where(corporate_type: @params[:type], status:true)
                end
            end
        end

        

    end
end
