class AddMobileNumberToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :mobile_number, :integer
  end
end
