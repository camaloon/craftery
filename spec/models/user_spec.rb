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

require 'spec_helper'

describe User do

  it { should validate_presence_of :name }
  it { should validate_presence_of :username }

end
