class TripsController < ApplicationController
    before_action :require_login, only: [:edit]

    def create
        @trip = TripGeneratorService.call(@user)
        # @trip = Trip.new
        # @trip.weather = Weather.new(user.zip)
        # @trip.restaurant = Restaurant.new(user.zip)
        if @trip.save
            redirect_to trip_path
        else
            flash[:alert] = "Sorry, your trip could not be created."
            redirect_to @user
        end
    end

    def show
        @trip = trip.find_by_id(params[:id])
        if @trip.nil?
            flash[:notice] = "Trip was not found, please click the trip button again."
            redirect_to @user
        end
    end
end
