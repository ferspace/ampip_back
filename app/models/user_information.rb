class UserInformation < ApplicationRecord
  belongs_to :user, optional: true
  has_one :user_rol, dependent: :destroy
  #has_one_attached :photo
end
