## Debug ####################################################################

step "pry" do
  require 'pry'
  binding.pry
end

## Generic HTML #############################################################

step "I click on :link_name" do |link_name|
  click_on link_name
end

step "I click on :link_name for :resource_type :resource_name in the List" do |link_name, resource_type, resource_name|
  css_id_prefix = resource_type.downcase + '_'
  id = resource_type.capitalize.constantize.find_by_name(resource_name).id
  within "##{css_id_prefix}#{id}" do
    click_on link_name
  end
end

step "I click on :link_name for the first :resource_type in the List" do |link_name, resource_type|
  within_first_in_list(resource_type) do
    click_on link_name
  end
end

step "I click the Title Link for the first :resource_type in the List" do |resource_type|
  within_first_in_list(resource_type) do
    xpath_first_link_in_title = '((.//h1|.//h2|.//h3|.//h4|.//h5|.//h6)//a)[1]'
    find(:xpath, xpath_first_link_in_title).click
  end
end

step "I fill/modify the text values of the form as follows" do |table|
  table.hashes.each do |hash|
    fill_in hash['Field'], with: hash['Value']
  end
end

step "I select the following values from the combo boxes of the form" do |table|
  table.hashes.each do |hash|
    select hash['Value'], from: hash['Field']
  end
end

step "the page shows" do |table|
  table.hashes.each do |hash|
    page.should have_content hash['Content']
  end
end

step "a form with the following fields is displayed" do |table|
  table.hashes.each do |hash|
    page.should have_content hash['Content']
  end
end

## Implementation specific ##################################################

step "the system informs me of the operation's success stating :message" do |message|
  page.should have_content 'Success: ' + message
end

step "I visit the :route_human_name Page" do |route_human_name|
  visit self.send(route_human_name_to_str(route_human_name))
end

## Helpers ##################################################################

def route_human_name_to_str(route_human_name)
  route_human_name.parameterize.underscore + '_path'
end

def within_first_in_list(resource_type)
  within ".#{resource_type.parameterize.underscore}:first-of-type" do
    yield
  end
end
