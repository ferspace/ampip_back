class AddPropertiesToTenantUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :tenant_users, :property, null: false, foreign_key: true
  end
end
