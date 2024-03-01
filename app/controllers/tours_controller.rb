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
  end

  def new
    @tour = Tour.new
  end

  def my_tours
    @current_user = current_user.id
    @tours = Tour.where(user_id: @current_user)
    @prev_tours = @tours.where("date < ?", Date.today)
    @upcoming_tours = @tours.where("date >= ?", Date.today)

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
    params.require(:tour).permit(:title, :description, :duration, :max_spots, :price_per_person, :date, :category_id, :language, :location, :photo)
  end
end
