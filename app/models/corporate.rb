class Corporate < ApplicationRecord
    has_many :corporate_informations, dependent: :destroy
    has_many :Properties , dependent: :destroy
    has_many :user_informations , dependent: :destroy 
    enum corporate_type: [ :consultoría, :construcción, :energía, :financiero, :inmobiliario, :telecomunicaciones, :transporte, :otros ]
end
