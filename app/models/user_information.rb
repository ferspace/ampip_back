class UserInformation < ApplicationRecord
  belongs_to :user, optional: true
  has_one :user_rol, dependent: :destroy
  belongs_to  :corporate
  #has_one_attached :photo
end
