class ToursController < ApplicationController

  def index
    @tours = params[:query].present? ? Tour.search_for_tours(params[:query]) : Tour.all

    respond_to do |format|
      format.html
      format.json # This will automatically use `index.json.jbuilder`
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @user = @tour.bookings.select { |b| b.user == current_user }
    @booking = @tour.bookings.find_by(user: current_user)
    @user_nb = @booking&.nb_of_people
  end

  def new
    @tour = Tour.new
  end

  def my_tours
    @current_user = current_user.id
    @tours = Tour.where(user_id: @current_user)
    @tours_user = Tour.joins(:bookings).where(bookings: { user: current_user }).distinct

    @prev_tours = @tours.where("date < ?", Date.today)
    @upcoming_tours = @tours.where("date >= ?", Date.today)

    @prev_tours_user = @tours_user.where("date < ?", Date.today)
    @upcoming_tours_user = @tours_user.where("date >= ?", Date.today)
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

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update(tour_params)
    redirect_to my_tours_path(@tour)
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location, :photo)
  end
end
