class Project < ActiveRecord::Base
  has_many :personas
  has_many :features

  validates_presence_of :name
end
