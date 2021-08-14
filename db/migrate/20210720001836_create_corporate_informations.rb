class CreateCorporateInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :corporate_informations do |t|
      t.string :rfc
      t.string :social_media_tw
      t.string :social_media_fb
      t.string :social_media_inst
      t.string :social_media_link
      t.string :social_media_web
      t.references :corporate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
