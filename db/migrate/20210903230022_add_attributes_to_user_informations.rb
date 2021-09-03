class AddAttributesToUserInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :user_informations, :ext_num, :string
    add_column :user_informations, :int_num, :string
  end
end
