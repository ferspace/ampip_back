class PropertyInformations < ApplicationRecord
  belongs_to :property
  has_many :contacts, dependent: :destroy
end
