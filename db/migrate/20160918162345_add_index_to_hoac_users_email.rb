class AddIndexToHoacUsersEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :hoac_users, :email, unique: true
  end
end
