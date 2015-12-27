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
    belongs_to :trip
end
