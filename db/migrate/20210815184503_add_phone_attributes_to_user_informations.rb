class AddPhoneAttributesToUserInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :user_informations, :phone_office_lada, :integer
    add_column :user_informations, :phone_office_code, :integer
  end
end
