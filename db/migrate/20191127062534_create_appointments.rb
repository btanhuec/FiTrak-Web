class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :client_username
      t.string :date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
