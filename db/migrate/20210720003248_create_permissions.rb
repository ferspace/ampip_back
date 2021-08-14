class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description
      t.string :tipo
      t.timestamps
    end
  end
end
