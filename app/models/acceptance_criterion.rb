class AcceptanceCriterion < ActiveRecord::Base

  STATES = %w(pending accepted rejected)
  DEFAULT_STATE = 'pending'

  belongs_to :user_story

  validates_presence_of :description, :user_story

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(last_word_connector: ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }

end
