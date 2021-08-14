class TenantHistory < ApplicationRecord
  belongs_to :property
  belongs_to :tenant_users
end
