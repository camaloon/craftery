# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

require 'spec_helper'

describe Project do

  subject { build :project }

  it { should be_valid }
  it { should validate_presence_of :name }

end
