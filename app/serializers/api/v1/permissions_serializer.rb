class Api::V1::PermissionsSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :name,
                :description,
                :tipo,
                :created_at,
                :updated_at
end
