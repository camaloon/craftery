class User < ActiveRecord::Base
  has_many :features, foreign_key: :owner_id, inverse_of: :owner
  has_many :user_stories, foreign_key: :author_id, inverse_of: :author
  has_secure_password

  validates_presence_of :name, :username, :email
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_uniqueness_of :username

end
