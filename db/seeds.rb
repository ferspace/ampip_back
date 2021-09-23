# frozen_string_literal: true

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
permissionSet = Permission.create([{"name": "property"}, {"name": "user"}, {"name": "ship"}, {"name": "park"}, {"name": "ground"}, {"name": "corp"}, {"name": "sponsor"}, {"name": "tenant"}, {"name": "auth"}, {"name": "microsites"}, {"name": "dashboard"}]) 
userRolSet = UserRol.create([{"name": "admin_ampip"}, {"name": "user_ampip"}, {"name": "admin_society"}, {"name": "user_society"}, {"name": "admin_propiety"}, {"name": "user_propiety"}])



def createRelation 
    p "mensage"
    permissionsGet = Permission.all.pluck(:name, :id)
    userRolesGet = UserRol.all 

    userRolesGet.each do |userRol|
        if userRol.name == "admin_ampip"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:true, write:true}, {permission_id:Permission.find_by_name("user").id, read:true, write:true}, {permission_id:Permission.find_by_name("ship").id, read:true, write:true}, {permission_id:Permission.find_by_name("park").id, read:true, write:true}, {permission_id:Permission.find_by_name("ground").id, read:true, write:true}, {permission_id:Permission.find_by_name("corp").id, read:true, write:true}, {permission_id:Permission.find_by_name("sponsor").id, read:true, write:true}, {permission_id:Permission.find_by_name("tenant").id, read:true, write:true},{permission_id:Permission.find_by_name("auth").id, read:false, write:true},{permission_id:Permission.find_by_name("microsites").id, read:true, write:true}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])
        end
        if userRol.name == "user_ampip"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:false, write:false}, {permission_id:Permission.find_by_name("user").id, read:true, write:false}, {permission_id:Permission.find_by_name("ship").id, read:false, write:false}, {permission_id:Permission.find_by_name("park").id, read:false, write:false}, {permission_id:Permission.find_by_name("ground").id, read:false, write:false}, {permission_id:Permission.find_by_name("corp").id, read:false, write:false}, {permission_id:Permission.find_by_name("sponsor").id, read:false, write:false}, {permission_id:Permission.find_by_name("tenant").id, read:true, write:false},{permission_id:Permission.find_by_name("auth").id, read:false, write:false},{permission_id:Permission.find_by_name("microsites").id, read:false, write:false}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])
        end
        if userRol.name == "admin_society"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:true, write:true}, {permission_id:Permission.find_by_name("user").id, read:true, write:true}, {permission_id:Permission.find_by_name("ship").id, read:true, write:true}, {permission_id:Permission.find_by_name("park").id, read:true, write:true}, {permission_id:Permission.find_by_name("ground").id, read:true, write:true}, {permission_id:Permission.find_by_name("corp").id, read:true, write:true}, {permission_id:Permission.find_by_name("sponsor").id, read:true, write:true}, {permission_id:Permission.find_by_name("tenant").id, read:true, write:true},{permission_id:Permission.find_by_name("auth").id, read:true, write:false},{permission_id:Permission.find_by_name("microsites").id, read:true, write:true}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])
        end
        if userRol.name == "user_society"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:true, write:false}, {permission_id:Permission.find_by_name("user").id, read:false, write:false}, {permission_id:Permission.find_by_name("ship").id, read:false, write:false}, {permission_id:Permission.find_by_name("park").id, read:false, write:false}, {permission_id:Permission.find_by_name("ground").id, read:false, write:false}, {permission_id:Permission.find_by_name("corp").id, read:false, write:false}, {permission_id:Permission.find_by_name("sponsor").id, read:false, write:false}, {permission_id:Permission.find_by_name("tenant").id, read:false, write:false},{permission_id:Permission.find_by_name("auth").id, read:false, write:false},{permission_id:Permission.find_by_name("microsites").id, read:true, write:false}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])
        end
        if userRol.name == "admin_propiety"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:true, write:true}, {permission_id:Permission.find_by_name("user").id, read:false, write:false}, {permission_id:Permission.find_by_name("ship").id, read:true, write:true}, {permission_id:Permission.find_by_name("park").id, read:true, write:true}, {permission_id:Permission.find_by_name("ground").id, read:true, write:true}, {permission_id:Permission.find_by_name("corp").id, read:true, write:true}, {permission_id:Permission.find_by_name("sponsor").id, read:true, write:true}, {permission_id:Permission.find_by_name("tenant").id, read:true, write:true},{permission_id:Permission.find_by_name("auth").id, read:true, write:false},{permission_id:Permission.find_by_name("microsites").id, read:true, write:false}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])  
        end
        if userRol.name == "user_propiety"
            userRol.user_rol_permissions.create([{permission_id:Permission.find_by_name("property").id, read:false, write:false}, {permission_id:Permission.find_by_name("user").id, read:false, write:false}, {permission_id:Permission.find_by_name("ship").id, read:false, write:false}, {permission_id:Permission.find_by_name("park").id, read:false, write:false}, {permission_id:Permission.find_by_name("ground").id, read:false, write:false}, {permission_id:Permission.find_by_name("corp").id, read:false, write:false}, {permission_id:Permission.find_by_name("sponsor").id, read:false, write:false}, {permission_id:Permission.find_by_name("tenant").id, read:false, write:false},{permission_id:Permission.find_by_name("auth").id, read:false, write:false},{permission_id:Permission.find_by_name("microsites").id, read:true, write:false}, {permission_id:Permission.find_by_name("dashboard").id, read:true, write:true}])   
        end
    end

end

createRelation