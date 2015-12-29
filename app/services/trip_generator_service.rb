class TripGeneratorService 
    def call(user)
        trip = Trip.new
        trip.weather = Weather.new
        trip.weather.retrieve_from_api(user.zip)
        trip.restaurant = Restaurant.new(user.zip)
        trip
    end
end
