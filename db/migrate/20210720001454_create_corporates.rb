class CreateCorporates < ActiveRecord::Migration[6.1]
  def change
    create_table :corporates do |t|
      t.string :name
      t.string :english_name
      t.string :social_type
      t.string :address
      t.string :postal_code
      t.string :colony
      t.string :state
      t.string :municipality
      t.integer :cel
      t.decimal :anual_invetsment
      t.decimal :previus_anual_inv
      t.decimal :next_anual_inv
      t.datetime :downt_date
      t.integer :corporate_type
      t.boolean :status

      t.timestamps
    end
  end
end
