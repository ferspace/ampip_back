class AddConfToPropertyInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :property_informations, :confidencial, :boolean, default: false
  end
end
