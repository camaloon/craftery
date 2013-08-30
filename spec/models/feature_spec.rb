# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  owner_id    :integer
#  draft       :boolean
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Feature do
  pending "add some examples to (or delete) #{__FILE__}"
end
