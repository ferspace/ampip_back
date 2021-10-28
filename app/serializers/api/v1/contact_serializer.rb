class Api::V1::ContactSerializer < Api::V1::ApplicationSerializer
    attributes  :id, 
                :name,
                :phone_number,
                :website,
                :created_at,
                :updated_at,
                :property_informations
                
    has_many :property_informations
                
end