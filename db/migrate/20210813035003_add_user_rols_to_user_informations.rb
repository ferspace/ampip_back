class AddUserRolsToUserInformations < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_informations, :user_rols, null: false, foreign_key: true
  end
end
