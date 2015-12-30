# == Schema Information
#
# Table name: weathers
#
#  id          :integer          not null, primary key
#  temp_min    :integer
#  temp_max    :integer
#  description :string
#  icon        :string
#  rain_chance :integer
#  sunset      :integer
#  wind_speed  :integer
#  humidity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Weather < ActiveRecord::Base
    require 'open_weather'
    require 'pry'
    belongs_to :trip

    def self.retrieve_from_api(zip_code)
        options = { APPID: ENV['APPID'] }
        weather = OpenWeather::Current.zip("#{zip_code},US",options)
        #Temperature
        min_kelvin = weather['main']['temp_min']
        temp_min = (min_kelvin*(9/5.0) - 459.67).round 

        max_kelvin = weather['main']['temp_max']
        temp_max = (max_kelvin*(9/5.0) - 459.67).round 
        #Description
        description = weather['weather'][0]['description']
        #icon
        icon = weather['weather'][0]['icon']
        #rain_chance
        rain_chance = weather['clouds']['all']
        #sunset
        sunset = weather['sys']['sunset']
        #wind_speed
        wind_speed = weather['wind']['speed'].round
        #humidity
        humidity = weather['main']['humidity']
        Weather.create(temp_min: temp_min, temp_max: temp_max, description: description, icon: icon, rain_chance: rain_chance, sunset: sunset, wind_speed: wind_speed, humidity: humidity)
    end
end
