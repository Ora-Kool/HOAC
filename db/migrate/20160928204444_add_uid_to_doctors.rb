class AddUidToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :uid, :integer
  end
end
