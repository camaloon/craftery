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
#  state       :string(255)
#

require 'spec_helper'

describe Feature do

  it { should validate_presence_of :name }
  it { should validate_presence_of :project }
  it { should validate_presence_of :owner }
  it { should ensure_inclusion_of(:state).in_array(Feature::STATES) }

  it "should have default state if not set" do
    subject.state.should be Feature::DEFAULT_STATE
  end

end
