class AddFirstNameToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :first_name, :string
  end
end
