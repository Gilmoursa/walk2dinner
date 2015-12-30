class MapViewObject
    attr_accessor :user

    def initialize(user, restaurant=nil)
        @user = user
        @restaurant = restaurant
    end

    def directions_new_page
        "http://maps.google.com/maps?saddr=#{@user.address} #{@user.city} #{@user.state}&daddr=#{@restaurant.address} #{@restaurant.city} #{@restaurant.state}&ie=UTF8&t=roadmap&iwloc=B"
    end

    def directions
       directions_new_page + "&output=embed"
    end

    def user_location
        "https://maps.google.com/maps?hl=en&q=#{@user.address} #{@user.city} #{@user.state}&ie=UTF8&t=roadmap&z=15&iwloc=B&output=embed"
    end
end
