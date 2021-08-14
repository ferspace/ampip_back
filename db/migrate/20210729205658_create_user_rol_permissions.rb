class CreateUserRolPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rol_permissions do |t|
      t.references :permission, null: false, foreign_key: true
      t.references :user_rol, null: false, foreign_key: true
      t.boolean :read
      t.boolean :write

      t.timestamps
    end
  end
end
