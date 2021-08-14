class AddCorporateToUserInformations < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_informations, :corporate, null: false, foreign_key: true
  end
end
