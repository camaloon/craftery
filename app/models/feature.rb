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
#  status      :string(255)
#

class Feature < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :project

  validates_presence_of :owner, :project, :name

  validates :status, presence: true, inclusion: {
      in: %w(draft frozen),
      message: 'should be draft or frozen'
  }

  validate on: :create do |feature|
    unless feature.owner.nil?
      if feature.owner.role.nil?
        feature.errors.add(:owner, 'does not have an associated role')
      end
    end
  end

end
