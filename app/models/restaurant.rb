# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#  cuisine    :string
#  image_url  :string
#  rating     :string
#  snippet    :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
    belongs_to :trip
    def retrieve_from_api
        restaurant = Yelp.client.search(@user.zip, {term: 'food'}).businesses.sample(1)
        @name = restaurant.first.name
        #address
        @address = restaurant.first.location.address.first
        @city = restaurant.first.location.city
        @state = restaurant.first.location.state_code
        @zip = restaurant.first.location.postal_code
        @phone = restaurant.first.phone
        #more restaurant info
        @cuisine = restaurant.first.categories.flatten.first
        @url = restaurant.first.url
        @rating = restaurant.first.rating
        @image_url = restaurant.first.image_url
        @snippet = restaurant.first.snippet_text
        Restaurant.create(name: name, address: address, city: city, state: state, zip: zip, phone: phone, cuisine: cuisine, url: url, rating: rating, image_url: image_url, snippet: snippet)
      end

end
