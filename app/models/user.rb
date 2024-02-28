class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours
  has_many :bookings, through: :tours
  has_many :reviews, through: :bookings

  def total_rating
    if reviews.any?
      reviews.count
    else
      0
    end
  end

  def average_rating
    if reviews.any?
      reviews.average(:rating).to_f
    else
      0.0
    end
  end

  def show
    @user = current_user
  end
end
