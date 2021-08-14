class UserRol < ApplicationRecord
    has_many :user_rols, dependent: :destroy
    has_many :user_rol_permissions, dependent: :destroy
end
