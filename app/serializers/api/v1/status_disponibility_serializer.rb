class Api::V1::StatusDisponibilitySerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :status_property,
                :average_price,
                :use,
                :property_informations_id,
                :created_at,
                :updated_at

    has_many :property_informations
  
end 
  