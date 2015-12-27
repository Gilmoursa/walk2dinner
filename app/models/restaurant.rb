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
#  rating_url :string
#  snippet    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
    belongs_to :trip
end
