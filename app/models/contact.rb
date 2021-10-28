class Contact < ApplicationRecord
  belongs_to :property_informations, dependent: :destroy
end
