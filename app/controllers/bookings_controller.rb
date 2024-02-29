class BookingsController < ApplicationController
  def new
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tour = Tour.find(params[:tour_id])
    @booking.tour = @tour
    @booking.user = current_user
    if @booking.is_private
      @booking.total_price = @tour.price_per_person * (@tour.max_spots - 1)
    else
      @booking.total_price = @tour.price_per_person * @booking.nb_of_people.to_i
    end

    if @booking.save
      redirect_to root_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:tour_id, :is_private, :nb_of_people)
  end
end
