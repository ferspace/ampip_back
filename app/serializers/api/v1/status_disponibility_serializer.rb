class Api::V1::StatusDisponibilitySerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :status_property,
                :average_price,
                :use,
                :created_at,
                :updated_at
  
end 
  