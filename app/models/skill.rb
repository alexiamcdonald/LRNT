# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  skill      :string
#  system     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skill < ActiveRecord::Base

  belongs_to :settings

  scope :list_order, -> { order('lower(skills.name) ASC') }

  SKILLS = { french: 'French',
             english: 'English',
             spanish: 'Spanish',
             german: 'German',
             mandarin: 'Mandarin',
             japanese: 'Japanese'
           }

  validates :skill, :name, presence: true
  validates :skill, inclusion: {in: SKILLS.keys.map(&:to_s), message: '%{value} is not a supported skill'}, :if => :system
  validates :skill, uniqueness: {case_sensitive: false}

  def self.initialize!
    SKILLS.keys.map(&:to_s).each do |skill|
      next if Skill.find_by_skill(skill)
      Skill.create!({
        skill: skill,
        name: SKILLS[skill.to_sym],
        system: true
        })
    end
  end
end
