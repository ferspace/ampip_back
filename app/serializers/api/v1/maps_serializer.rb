class Api::V1::MapsSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :name,
                :lat,
                :lng,
                :details,
                :created_at,
                :updated_at
end