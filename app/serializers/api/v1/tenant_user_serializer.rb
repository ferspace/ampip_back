class Api::V1::TenantUserSerializer < Api::V1::ApplicationSerializer

    attributes  :id,
                :property,
                :name_bussines, 
                :country, 
                :product_badge, 
                :ID_SCIAN, 
                :ID_DENUE, 
                :antiquity, 
                :superficie, 
                :created_at, 
                :updated_at

end