class BusinessGoal < ActiveRecord::Base

  STATES = %w(pending achieved not_achieved)
  DEFAULT_STATE = 'pending'

  belongs_to :feature

  validates_presence_of :description, :feature

  validates :state, presence: true, inclusion: {
      in: STATES,
      message: 'should be one of ' + STATES.to_sentence(last_word_connector: ' or ')
  }

  after_initialize { self.state ||= DEFAULT_STATE }

end
