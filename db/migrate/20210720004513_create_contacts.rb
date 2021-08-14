class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :property_informations, null: false, foreign_key: true
      t.string :name
      t.integer :phone_number
      t.string :website

      t.timestamps
    end
  end
end
