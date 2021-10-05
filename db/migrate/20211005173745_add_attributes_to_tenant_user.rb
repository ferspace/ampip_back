class AddAttributesToTenantUser < ActiveRecord::Migration[6.1]
  def change
    add_column :tenant_users, :type_use, :string
  end
end
