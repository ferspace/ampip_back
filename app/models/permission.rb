class Permission < ApplicationRecord
  has_many :user_rol_permissions, dependent: :destroy
end
