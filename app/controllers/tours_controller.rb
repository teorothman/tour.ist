class ToursController < ApplicationController

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save
      redirect_to root_path, notice: "Your tour was succesfully created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location)
  end
end
