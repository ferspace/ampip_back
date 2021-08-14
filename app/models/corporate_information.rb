class CorporateInformation < ApplicationRecord
  belongs_to :corporate, dependent: :destroy
end
