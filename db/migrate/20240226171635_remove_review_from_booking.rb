class RemoveReviewFromBooking < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :review, index: true, foreign_key: true
  end
end
