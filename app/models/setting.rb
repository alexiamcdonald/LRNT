# == Schema Information
#
# Table name: settings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  location_id :integer
#  bio         :text
#  learn_one   :integer
#  learn_two   :integer
#  learn_three :integer
#  teach_one   :integer
#  teach_two   :integer
#  teach_three :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Setting < ActiveRecord::Base
  has_many :skills
  belongs_to :users
end
