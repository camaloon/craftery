# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  owner_id    :integer
#  draft       :boolean
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Feature < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :project

  validates_presence_of :owner, :project, :name
end
