# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  area       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
end
