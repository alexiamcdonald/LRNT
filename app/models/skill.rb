class Skill < ActiveRecord::Base

  scope :list_order, -> { active_first.order('lower(skills.name) ASC') }
  scope :active_or_ids, -> (ids) do
    if ids.present?
      where('skills.active OR skills.id IN (?)', ids)
    else
      where(active: true)
    end
  end

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
