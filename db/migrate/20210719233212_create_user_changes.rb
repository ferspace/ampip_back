class CreateUserChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :user_changes do |t|
      t.text :previews_value
      t.text :next_value
      t.text :message
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
