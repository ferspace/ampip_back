class AddCelAttributesToCorporates < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :cel_lada, :integer
    add_column :corporates, :cel_code, :integer
  end
end
