class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params[:tour_id])
    @booking.save!
    redirect_to "/tours/:tour_id/bookings/:id"
  end

  def show
  end

  private

  def booking_params
    require.params(:booking).permit(:tour_id, :is_private)
  end
end
