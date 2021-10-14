class AddNewsAttributesToPropertyInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :property_informations, :id_bilda, :string
  end
end
