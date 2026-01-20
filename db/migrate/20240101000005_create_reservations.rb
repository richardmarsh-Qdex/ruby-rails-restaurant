class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :customer_name
      t.string :customer_email
      t.datetime :reservation_date
      t.integer :party_size
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
