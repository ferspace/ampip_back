class CreateStatusDisponibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :status_disponibilities do |t|
      t.boolean :status_property
      t.decimal :average_price
      t.string :use
      t.references :property_informations, foreign_key: true
      t.timestamps
    end
  end
end
  