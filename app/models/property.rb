class Property < ApplicationRecord
  belongs_to :corporate
  has_many :property_informations , dependent: :destroy
  has_many :tenant_histories , dependent: :destroy
  has_many :property_users , dependent: :destroy
end
