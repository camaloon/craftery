# == Schema Information
#
# Table name: user_stories
#
#  id            :integer          not null, primary key
#  author_id     :integer
#  persona_id    :integer
#  desire        :text
#  benefit       :text
#  feature_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  contextual_id :integer
#

class UserStory < ActiveRecord::Base
  has_many :acceptance_criteria
  belongs_to :author, class_name: "User"
  belongs_to :persona
  belongs_to :feature

  CODE_PREFIX = 'US'

  validates_presence_of :author, :persona, :desire, :benefit, :feature

  def code
    code_id = read_attribute(:contextual_id) ? read_attribute(:contextual_id) : read_attribute(:id)
    CODE_PREFIX + code_id.to_s
  end
end
