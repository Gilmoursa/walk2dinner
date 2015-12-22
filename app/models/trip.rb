class Trip < ActiveRecord::Base
    has_one :weather
    has_one :restaurant
    belongs_to :user
end
