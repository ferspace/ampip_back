module Permissions
    class OauthToken

        def initialize(id,table)
            @id = id
            @table = table
        end

        def rescue_user_permission_create
            @type = "write"
            if @id != nil
                @user = UserInformation.where(user_id:@id[:id])
                if @user != []
                    return search_permission
                else
                    return [0]
                end
            end
        end    

        def rescue_user_permission_read
            @type = "read"
            if @id != nil
                @user = UserInformation.where(user_id:@id[:id])
                if @user != []
                    return search_permission
                else
                    return [0]
                end
            end
        end 

        private

        def rescue_user_role_permission(id)
            permission = []
            userRolePermision = UserRolPermission.where(user_rol_id:id)
            for i in userRolePermision
                permissionWhitName = []
                permissionWhitName.append("id": Permission.where(id: i.permission_id)[0].name, "read": i.read, "write": i.write)
                permission.append(permissionWhitName[0])
            end 
            return permission
        end

        def search_permission
            listOfPermissions = rescue_user_role_permission(@user[0][:user_rols_id])
            permission = false
            for i in listOfPermissions
              if i[:id] == @table
                permission = read_write(i)
              end
            end
            return permission
        end

        def read_write(item)
            case @type
                when "read"
                    return item[:read]
                when "write"
                    return item[:write]
            end
        end

    end
end
