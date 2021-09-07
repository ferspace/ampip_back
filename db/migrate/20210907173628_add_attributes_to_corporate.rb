class AddAttributesToCorporate < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :ext_num, :string
    add_column :corporates, :int_num, :string
  end
end
