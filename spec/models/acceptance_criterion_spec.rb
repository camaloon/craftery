# == Schema Information
#
# Table name: acceptance_criteria
#
#  id            :integer          not null, primary key
#  description   :text
#  state         :string(255)
#  user_story_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  author_id     :integer
#

require 'spec_helper'

describe AcceptanceCriterion do
  pending "add some examples to (or delete) #{__FILE__}"
end
