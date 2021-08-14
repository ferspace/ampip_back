class Api::V1::PropertySerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :corporate_id,
                :tipo,
                :created_at,
                :updated_at,
                :nombre
                 
end
