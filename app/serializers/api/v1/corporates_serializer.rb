class Api::V1::CorporatesSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :name, 
                :english_name,
                :social_type, 
                :address,
                :postal_code,
                :colony,
                :state,
                :municipality,
                :cel, 
                :anual_invetsment, 
                :previus_anual_inv, 
                :next_anual_inv, 
                :downt_date,
                :corporate_type,
                :status,
                :created_at,
                :updated_at,
                :cel_lada,
                :cel_code
    
    has_many :users
end
