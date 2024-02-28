class Tour < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  def spots_left
    # n = 0
    # bookings.each do |b|
    #   n += b.nb_of_people
    # end
    max_spots - bookings.pluck(:nb_of_people).sum
  end
end
