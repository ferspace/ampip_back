class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :corporate, null: false, foreign_key: true
      t.integer :tipo
      t.string :nombre, null: true
      t.timestamps
    end
  end
end
