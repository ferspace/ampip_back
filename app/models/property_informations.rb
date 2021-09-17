class PropertyInformations < ApplicationRecord
  belongs_to :property
  has_many :contacts, dependent: :destroy
  has_many :status_disponibilities, dependent: :destroy
  enum status: [ :activo, :inactivo, :publicado ]
end
