class TripGeneratorService 
    def self.call(user)
        weather = Weather.retrieve_from_api(user.zip)
        restaurant = Restaurant.retrieve_from_api(user.zip)
        trip = Trip.create(weather_id: weather.id, restaurant_id: restaurant.id)
    end
end
