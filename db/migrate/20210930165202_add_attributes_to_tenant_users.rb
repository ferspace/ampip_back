class AddAttributesToTenantUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :tenant_users, :sector, :string
  end
end
