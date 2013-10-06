# == Schema Information
#
# Table name: personas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Persona < ActiveRecord::Base
  has_many :user_stories
  belongs_to :project

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    self[:name]
  end
end
