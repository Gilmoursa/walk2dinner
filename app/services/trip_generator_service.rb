class TripGeneratorService 
    require 'pry'
    def self.call(user)
        trip = Trip.new
        binding.pry
        trip.weather.retrieve_from_api(user.zip)
        trip.restaurant.retrieve_from_api(user.zip)
        trip
    end
end
