class AddDobToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :dob, :date
  end
end
