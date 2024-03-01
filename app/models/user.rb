class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours
  has_many :bookings, through: :tours
  has_many :reviews, through: :bookings
  has_one_attached :photo

  def total_rating
    if reviews.any?
      reviews.count
    else
      0
    end
  end

  def average_rating
    if reviews.any?
      reviews.average(:rating).to_f.round(1)
    else
      0.0
    end
  end

  def avatar_id
    if photo.attached?
      photo.key
    else
      "arwpvws5od2yqqq6y3cf"
    end
  end
end
