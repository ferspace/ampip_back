class CreatePropertyInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :property_informations do |t|
      t.references :property, null: false, foreign_key: false
      t.string :name
      t.string :tipo
      t.integer :superficie
      t.string :address
      t.string :english_name
      t.string :park_property
      t.string :region
      t.string :market
      t.string :industry
      t.integer :suprficie_total 
      t.integer :superficie_urbanizada
      t.integer :superficie_disponible
      t.string :inicio_de_operaciones
      t.integer :number_employe
      t.text :practices_recognition
      t.text :infrastructure
      t.integer :navy_number
      t.text :message
      t.string :postal_code
      t.string :colony
      t.string :municipality
      t.string :state
      t.integer :status
      t.string :unity
      t.string :image
      t.timestamps
    end
  end
end
