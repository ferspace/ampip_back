class AddLatlngAttributesToPropertyInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :property_informations, :lat, :string
    add_column :property_informations, :lng, :string
  end
end
