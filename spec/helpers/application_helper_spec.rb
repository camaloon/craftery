  require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProjectsHelper. For example:
#
# describe ProjectsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do

  describe "bootstrap_flash_type" do
    it { expect(helper.bootstrap_flash_type('alert')).to eq 'danger' }
  end

  describe "user_flash_type" do
    it { expect(helper.user_flash_type('alert')).to eq 'Warning' }
  end

end
