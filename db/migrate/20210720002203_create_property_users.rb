class CreatePropertyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :property_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :type_property
      t.timestamps
    end
  end
end
