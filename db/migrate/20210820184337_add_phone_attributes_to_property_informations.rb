class AddPhoneAttributesToPropertyInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :property_informations, :phone, :string
    add_column :property_informations, :lada, :string
    add_column :property_informations, :code, :string
  end
end
