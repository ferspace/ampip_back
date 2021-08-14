class Contact < ApplicationRecord
  belongs_to :property_information, dependent: :destroy
end
