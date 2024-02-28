class Tour < ApplicationRecord
  has_one_attached :photo

  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location, presence: true
  validates :max_spots, :price_per_person, :duration, numericality: { only_integer: true }
end
