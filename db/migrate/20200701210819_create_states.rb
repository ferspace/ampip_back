class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.integer :cities_count, null: false
    end
  end
end
