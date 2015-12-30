class TripsController < ApplicationController
    before_action :require_login, only: [:edit]

    def create
        @user = current_user
        @trip = TripGeneratorService.call(@user)

        if @trip.save
            redirect_to trip_path
        else
            flash[:alert] = "Sorry, your trip could not be created."
            redirect_to @user
        end
    end

    def show
        raise
        @trip = Trip.find_by_id(params[:id])
        @restaurant = Restaurant.find_by_id(@trip.restaurant_id)
        @weather = Weather.find_by_id(@trip.weather_id)
        if @trip.nil?
            flash[:notice] = "Trip was not found, please click the trip button again."
            redirect_to current_user
        end
    end
end
