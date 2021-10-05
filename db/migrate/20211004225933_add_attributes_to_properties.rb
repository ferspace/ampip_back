class AddAttributesToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :type_use, :string
  end
end
