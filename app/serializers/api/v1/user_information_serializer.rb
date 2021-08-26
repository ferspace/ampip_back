class Api::V1::UserInformationSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :user_id,
              :full_name,
              :last_name,
              :address,
              :state,
              :office_address,
              :charge,
              :date_of_birth,
              :phone_office,
              :cel,
              :corporate_id,
              :status,
              :municipality,
              :colony,
              :postal_code_number,
              :user_rols_id,
              :user_type,
              :created_at,
              :updated_at,
              :phone_office_lada,
              :phone_office_code
  has_one :user
  has_one :corporate
end
