class Persona < ActiveRecord::Base
  has_many :user_stories
  belongs_to :project

  validates_presence_of :name
  validates_uniqueness_of :name
end
