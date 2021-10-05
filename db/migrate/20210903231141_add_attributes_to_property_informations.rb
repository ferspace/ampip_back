class AddAttributesToPropertyInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :property_informations, :num_int, :string
    add_column :property_informations, :num_ext, :string
  end
end
