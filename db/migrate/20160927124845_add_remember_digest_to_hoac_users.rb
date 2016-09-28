class AddRememberDigestToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :remember_digest, :string
  end
end
