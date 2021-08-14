class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_information, dependent: :destroy
  has_many :user_changes, dependent: :destroy
  has_many :property_users, dependent: :destroy
  enum user_type: [ :admin_ampip, :user_ampip, :admin_society, :user_society, :admin_propiety, :user_propiety ]
  acts_as_token_authenticatable
end