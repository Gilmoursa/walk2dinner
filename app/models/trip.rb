# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  weather_id    :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Trip < ActiveRecord::Base
    has_one :weather
    has_one :restaurant
    belongs_to :user
end
