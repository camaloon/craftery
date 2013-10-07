# == Schema Information
#
# Table name: user_stories
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  persona_id :integer
#  desire     :text
#  benefit    :text
#  feature_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserStory < ActiveRecord::Base
  has_many :acceptance_criteria
  belongs_to :author, class_name: "User"
  belongs_to :persona
  belongs_to :feature

  validates_presence_of :author, :persona, :desire, :benefit, :feature

  def code
     "US#{self[:id]}"
  end

  def to_s(length = 40)
    "#{code}: As a(n) #{self.persona} I want to #{self[:desire]}".truncate(length)
  end
end
