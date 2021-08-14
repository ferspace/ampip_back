class CreateUserRols < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rols do |t|
      t.string :name
      t.integer :children_id
      t.integer :parent_id
      t.timestamps
    end
  end
end
