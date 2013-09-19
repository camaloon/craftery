# == Schema Information
#
# Table name: user_stories
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  persona_id :integer
#  desire     :text
#  benefit    :text
#  feature_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe UserStory do
  pending "add some examples to (or delete) #{__FILE__}"
end
