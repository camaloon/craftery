# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Role do

  subject { build :role }

  it { should be_valid }
  it { should validate_presence_of :name }

end
