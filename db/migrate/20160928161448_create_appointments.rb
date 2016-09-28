class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.references :hoac_user, foreign_key: true

      t.timestamps
    end
  end
end
