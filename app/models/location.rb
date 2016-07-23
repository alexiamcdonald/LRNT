# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  area       :string
#

class Location < ActiveRecord::Base
  belongs_to :settings

  scope :list_order, -> { order('lower(locations.name) ASC') }

  AREAS = { melbourne: 'Melbourne',
            sydney: 'Sydney',
            brisbane: 'Brisbane',
            geelong: 'Geelong',
            canberra: 'Canberra',
            adelaide: 'Adelaide'
           }

  validates :area, :country, :name, presence: true
  validates :area, inclusion: {in: AREAS.keys.map(&:to_s), message: '%{value} is not a supported area'}, :if => :system
  validates :area, uniqueness: {case_sensitive: false}

  def self.initialize!
    AREAS.keys.map(&:to_s).each do |name|
      next if Location.find_by_name(name)
      Location.create!({
        area: name,
        name: AREAS[name.to_sym],
        country: 'Australia'
        })
    end
  end
end
