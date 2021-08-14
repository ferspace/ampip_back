class Corporate < ApplicationRecord
    has_many :corporate_informations, dependent: :destroy
    has_many :Properties , dependent: :destroy
    has_many :user_informations , dependent: :destroy 
end
