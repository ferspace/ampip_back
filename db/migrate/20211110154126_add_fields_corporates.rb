class AddFieldsCorporates < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :membership, :string
  end
end
