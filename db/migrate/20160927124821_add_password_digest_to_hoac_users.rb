class AddPasswordDigestToHoacUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :hoac_users, :password_digest, :string
  end
end
