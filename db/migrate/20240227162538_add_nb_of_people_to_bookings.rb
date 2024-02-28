class AddNbOfPeopleToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :nb_of_people, :integer
  end
end
