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

require 'spec_helper'

describe User do

  subject { build :user }

  it { should be_valid }
  it { should validate_presence_of :name }
  it { should validate_presence_of :username }

end
