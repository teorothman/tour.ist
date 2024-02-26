class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user_id, null: false, foreign_key: true
      t.integer :total_price
      t.references :tour_id, null: false, foreign_key: true
      t.references :review_id, null: false, foreign_key: true
      t.boolean :is_private

      t.timestamps
    end
  end
end
