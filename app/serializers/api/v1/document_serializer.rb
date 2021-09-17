class Api::V1::DocumentSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :name,
                :url,
                :detail,
                :created_at,
                :updated_at
end