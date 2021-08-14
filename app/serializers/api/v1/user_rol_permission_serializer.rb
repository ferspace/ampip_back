class Api::V1::UserRolPermissionSerializer < Api::V1::ApplicationSerializer

    attributes  :id,
                :permission_id,
                :user_rol_id,
                :read,
                :write,
                :created_at,
                :updated_at
end
