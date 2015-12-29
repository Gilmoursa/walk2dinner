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
#  sunset      :time
#  wind_speed  :integer
#  humidity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Weather < ActiveRecord::Base
    require 'open_weather'
    belongs_to :trip

    def retrieve_from_api(zip_code)
        options = { APPID: ENV['APPID'] }
        weather = OpenWeather::Current.zip("#{zip_code},US",options)
        #Temperature
        min_kelvin = weather['main']['temp_min']
        @temp_min = to_fahrenheit(min_kelvin)

        max_kelvin = weather['main']['temp_max']
        @temp_max = to_fahrenheit(max_kelvin)
        #Description
        @description = weather['weather'][0]['description']
        #icon
        @icon = weather['weather'][0]['icon']
        #rain_chance
        @rain_chance = weather['clouds']['all']
        #sunset
        @sunset = weather['sys']['sunset']
        #wind_speed
        @wind_speed = weather['wind']['speed'].round
        #humidity
        @humidity = weather['main']['humidity']
    end

    def to_fahrenheit(temp)
        (temp*(9/5.0) - 459.67).round 
    end
end
