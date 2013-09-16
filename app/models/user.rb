# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  username        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#

class User < ActiveRecord::Base
  has_many :features, foreign_key: :owner_id, inverse_of: :owner
  has_secure_password

  validates_presence_of :name, :username, :email
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

end
