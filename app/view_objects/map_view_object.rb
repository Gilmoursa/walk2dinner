class MapViewObject
    attr_accessor :current_user

    def initialize(current_user,restaurant=nil)
        @current_user = current_user
        @restaurant = restaurant
    end

    def directions_new_page
        "http://maps.google.com/maps?saddr=#{@current_user.address} #{@current_user.city} #{@current_user.state}&daddr=#{@restaurant.address} #{@restaurant.city} #{@restaurant.state}&ie=UTF8&t=roadmap&iwloc=B"
    end

    def directions
       directions_new_page + "&output=embed"
    end

    def user_location
        "https://maps.google.com/maps?hl=en&q=#{@current_user.address} #{@current_user.city} #{@current_user.state}&ie=UTF8&t=roadmap&z=15&iwloc=B&output=embed"
    end
end
