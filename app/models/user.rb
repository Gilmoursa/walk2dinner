class User < ActiveRecord::Base
    has_many :trips
    has_many :restaurants, through: :trips
    has_many :weathers, through: :trips
    
    validates_presence_of :name, :email, :address, :zip, :phone, :city, :state
    validates :email, format: {:with => /@/}
    has_secure_password
end
