# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  address         :string
#  city            :string
#  state           :string
#  zip             :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
    has_many :trips
    has_many :restaurants, through: :trips
    has_many :weathers, through: :trips
    
    validates_presence_of :name, :email, :address, :zip, :phone, :city, :state
    validates :email, format: {:with => /@/}
    has_secure_password
end
