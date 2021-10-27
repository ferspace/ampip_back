class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :tenant_users, :id_propiedad, :string
  end
end
