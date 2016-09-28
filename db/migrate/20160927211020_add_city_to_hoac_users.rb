class AddCityToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :city, :string
  end
end
