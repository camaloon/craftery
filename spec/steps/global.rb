module Turnip::Steps

  ## Debug ####################################################################

  step "pry" do
    require 'pry'
    binding.pry
  end

  ## Generic HTML #############################################################

  step "I click the :link_name link" do |link_name|
    click_on link_name
  end

  step "I fill/modify the values of the form as follows" do |table|
    table.hashes.each do |hash|
      fill_in hash['Field'], with: hash['Value']
    end
  end

  ## Implementation specific ##################################################

  step "I am identified in the system with the following data" do |table|
    user_data = table.hashes.first
    @logged_user = create :user, username: user_data['Username'], name: user_data['Name']
  end

  step "the system informs me of the operation's success stating :message" do |message|
    page.should have_content 'Success: ' + message
  end

  step "I visit the :route_human_name Page" do |route_human_name|
    visit self.send(route_human_name_to_str(route_human_name))
  end

  ## Helpers ##################################################################

  def route_human_name_to_str(route_human_name)
    route_human_name.titlecase.gsub(/ /, '').underscore + '_path'
  end

end

