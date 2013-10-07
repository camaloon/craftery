# == Schema Information
#
# Table name: acceptance_criteria
#
#  id            :integer          not null, primary key
#  description   :text
#  state         :string(255)
#  user_story_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  author_id     :integer
#

class AcceptanceCriterion < ActiveRecord::Base

  STATES = %w(pending accepted rejected)
  DEFAULT_STATE = 'pending'

  belongs_to :user_story
  belongs_to :author, class_name: "User"

  validates_presence_of :author, :description, :user_story

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(last_word_connector: ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }

  def code
    "AC#{self[:id]}"
  end

end
