class Feature < ActiveRecord::Base
  STATES = %w(draft frozen)
  DEFAULT_STATE = 'draft'

  has_many :user_stories
  belongs_to :owner, class_name: "User"
  belongs_to :project

  validates_presence_of :owner, :project, :name

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(last_word_connector: ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }
end
