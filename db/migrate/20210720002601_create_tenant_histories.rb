class CreateTenantHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :tenant_histories do |t|
      t.references :property, null: false, foreign_key: true
      t.references :tenant_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
