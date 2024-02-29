class Tour < ApplicationRecord
  has_one_attached :photo

  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location, presence: true
  validates :max_spots, :price_per_person, :duration, numericality: { only_integer: true }

  def spots_left
    # n = 0
    # bookings.each do |b|
    #   n += b.nb_of_people
    # end
    booked_spots = bookings.pluck(:nb_of_people).compact.sum
    max_spots - booked_spots
  end

  def has_reservations?
    bookings.sum(:nb_of_people) > 0
  end
end
