module FeatureSteps

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
    visit self.send(route_human_name_to_str(route_human_name), feature.project, feature)
  end

  ## Expectations #############################################################

  # Feature's Detail Page

  step "the :feature_name Feature's Details are displayed" do |feature_name|
    feature = Feature.find_by_name! feature_name
    owner = feature.owner
    page.should have_content feature.name.capitalize
    page.should have_content feature.description
    page.should have_content feature.state
    page.should have_content /(#{owner.name.titleize}|#{owner.username})/
    page.should have_content feature.project.name.capitalize
  end

  step "the Project Feature Page displays showing :new_name and :new_description" do |new_name, new_description|
    page.should have_content new_name.capitalize
    page.should have_content new_description
  end

  # Features list

  step "the following Features should be displayed in a list" do |table|
    table.hashes.each do |hash|
      owner = User.find_by_username! hash['Owner']
      page.should have_content hash['Name'].capitalize
      page.should have_content hash['Description']
      page.should have_content hash['State']
      page.should have_content /(#{owner.name.titleize}|#{owner.username})/
    end
  end

  # Edit Feature Form

  step "the Edit Feature Form is displayed populated with the values for Feature :feature_name" do |feature_name|
    feature = Feature.find_by_name! feature_name
    find_field('* Name').value.should eq feature.name
    find_field('Description').value.should eq feature.description
  end

  # New Feature Form

  step "the New Feature Form is displayed" do
    # TODO: this check throws a Capybara::ElementNotFound exception when the
    # field doesn't exist. Can these expectations be better written? (this
    # works anyway).
    page.should have_field('* Name')
    page.should have_field('Description')
    page.should have_button('Create Feature')
  end

end
