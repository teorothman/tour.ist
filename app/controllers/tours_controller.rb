class ToursController < ApplicationController

  # def index
  #   @tours = Tour.all
  # end

  # def new
  #   @tour = Tour.new
  # end

  # def create
  #   @tour = Tour.new(tour_params)
  #   @tour.save! # add some if statement
  # end

  def show
    @tour = Tour.find(params[:id])
  end

  # private

  # def tour_params
  #   params.require(:tour).permit(
  #     :title, :description, :duration,
  #     :max_spots, :price_per_person,
  #     :date, :category_id, :user_id,
  #     :language, :location
  #   )
  # end
end
