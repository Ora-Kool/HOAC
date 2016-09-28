class AddStreetToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :street, :string
  end
end
