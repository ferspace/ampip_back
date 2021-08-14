class AddPropertyToPropertyUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :property_users, :property, null: false, foreign_key: true
  end
end
