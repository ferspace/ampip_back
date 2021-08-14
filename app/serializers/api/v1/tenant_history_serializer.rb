class Api::V1::TenantHistorySerializer < Api::V1::ApplicationSerializer

    attributes  :id,
                :property_id, 
                :tenant_user_id,
                :created_at

end