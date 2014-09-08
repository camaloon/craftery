class UserStory < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :persona
  belongs_to :feature

  validates_presence_of :author, :persona, :desire, :benefit, :feature

  def code
    "US#{self[:id]}"
  end
end
