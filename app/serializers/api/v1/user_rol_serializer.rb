class Api::V1::UserRolSerializer < Api::V1::ApplicationSerializer

    attributes  :id,
                :name,
                :children_id,
                :parent_id,
                :created_at,
                :updated_at
end
