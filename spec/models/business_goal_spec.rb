# == Schema Information
#
# Table name: business_goals
#
#  id          :integer          not null, primary key
#  description :text
#  state       :string(255)
#  feature_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  author_id   :integer
#

require 'spec_helper'

describe BusinessGoal do
  pending "add some examples to (or delete) #{__FILE__}"
end
