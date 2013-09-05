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

  it "should validate that its owner has a role" do
    feature = build :feature, owner: build(:user, role: nil)
    expect(feature).not_to be_valid
    feature.owner.role = FactoryGirl.build :role
    expect(feature).to be_valid
  end

end
