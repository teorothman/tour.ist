class ToursController < ApplicationController
  def index
    @tours = Tour.all

    if params[:search_by_city] && params[:search_by_city] != ""
      @tours = @tours.select { |n| n.location.downcase == params[:search_by_city].downcase}
    end
  end
end
