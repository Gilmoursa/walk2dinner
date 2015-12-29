class TripsController < ApplicationController
    before_action :require_login, only: [:edit]

    def create
        @trip = Trip.new
        @trip.weather = Weather.new(user.zip)
        @trip.restaurant = Restaurant.new(user.zip)
        if @trip.save
            log_in(@trip)
            redirect_to @trip
        else
            flash[:alert] = "Sorry, your trip could not be created."
            render 'new'
        end
    end

    def show
        @trip = trip.find_by_id(params[:id])
        if @trip.nil?
            flash[:notice] = "Trip was not found, please login or sign up."
            redirect_to signup_path
        end
    end
end
