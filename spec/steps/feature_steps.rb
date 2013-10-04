## Preconditions and Actions ################################################

step "the project :project_name has the following Features" do |project_name, table|
  table.hashes.each do |hash|
    owner = User.find_by_username! hash['Owner']
    project = Project.find_by_name! project_name
    create :feature, name: hash['Name'], description: hash['Description'], state: hash['State'], owner: owner, project: project
  end
end

step "I visit the :route_human_name Page for Feature :feature_name" do |route_human_name, feature_name|
  feature = Feature.find_by_name! feature_name
  visit self.send(route_human_name_to_str(route_human_name), feature)
end
