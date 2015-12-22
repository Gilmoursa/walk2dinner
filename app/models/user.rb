class User < ActiveRecord::Base
    has_many :trips
    has_many :restaurants, through: :trips
    has_many :weathers, through: :trips
end
