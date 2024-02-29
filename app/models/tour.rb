class Tour < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo

  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location, presence: true
  validates :max_spots, :price_per_person, :duration, numericality: { only_integer: true }

  pg_search_scope :search_for_tours,
                  against: [ :title, :description, :location, :language ],
                  associated_against: {
                    category: [:title]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def spots_left
    # n = 0
    # bookings.each do |b|
    #   n += b.nb_of_people
    # end
    max_spots - bookings.pluck(:nb_of_people).sum
  end
end
