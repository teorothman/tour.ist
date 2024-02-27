class AddBookingToReviews < ActiveRecord::Migration[7.1]
  def change
    change_table :reviews do |t|
      t.references :booking, null: false, foreign_key: true
    end
  end
end
