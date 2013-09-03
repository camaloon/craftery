# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Project < ActiveRecord::Base
  has_many :features

  validates_presence_of :name
end
