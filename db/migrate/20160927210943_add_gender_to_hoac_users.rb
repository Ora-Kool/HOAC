class AddGenderToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :gender, :string
  end
end
