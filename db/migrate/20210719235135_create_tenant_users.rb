class CreateTenantUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tenant_users do |t|
      
      t.string :name_bussines
      t.string :country
      t.string :product_badge
      t.integer :ID_SCIAN
      t.integer :ID_DENUE
      t.integer :antiquity
      t.integer :superficie
      t.timestamps
    end
  end
end
