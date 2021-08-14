class UserRolPermission < ApplicationRecord
  belongs_to :permission
  belongs_to :user_rol
end
