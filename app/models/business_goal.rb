# == Schema Information
#
# Table name: business_goals
#
#  id          :integer          not null, primary key
#  description :text
#  state       :string(255)
#  feature_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  author_id   :integer
#

class BusinessGoal < ActiveRecord::Base

  STATES = %w(pending achieved not_achieved)
  DEFAULT_STATE = 'pending'

  belongs_to :feature
  belongs_to :author, class_name: "User"

  validates_presence_of :author, :description, :feature

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(last_word_connector: ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }

  def code
    "BG#{self[:id]}"
  end

end
