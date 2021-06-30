class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :user_id
      t.string :room_id
      t.integer :total_price
      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
