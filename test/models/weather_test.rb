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

require 'test_helper'

class WeatherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
