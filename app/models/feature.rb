# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  owner_id    :integer
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  state       :string(255)
#

class Feature < ActiveRecord::Base

  STATES = %w(draft frozen)
  DEFAULT_STATE = 'draft'

  has_many :user_stories
  belongs_to :owner, class_name: "User"
  belongs_to :project

  validates_presence_of :owner, :project, :name

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(:last_word_connector => ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }

end
