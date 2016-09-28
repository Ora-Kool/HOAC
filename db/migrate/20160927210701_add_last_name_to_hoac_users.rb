class AddLastNameToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :last_name, :string
  end
end
