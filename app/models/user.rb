# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  password   :string(255)
#  role_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#

class User < ActiveRecord::Base
  belongs_to :role
  has_many :features, foreign_key: :owner_id, inverse_of: :owner

  validates_presence_of :name, :username
end
