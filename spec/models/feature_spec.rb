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

require 'spec_helper'

describe Feature do

  subject { build :feature }

  it { should be_valid }
  it { should validate_presence_of :name }
  it { should validate_presence_of :project }
  it { should validate_presence_of :owner }

end
