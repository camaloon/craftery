module ProjectSteps

  ## Preconditions and Actions ################################################

  step "the following Projects exist in the system" do  |table|
    table.hashes.each do |hash|
      create :project, name: hash['Name'], description: hash['Description']
    end
  end

  step "I visit the :route_human_name Page for Project :project_name" do |route_human_name, project_name|
    project = Project.find_by_name! project_name
    visit self.send(route_human_name_to_str(route_human_name), project)
  end

  ## Expectations #############################################################

  # Projects list

  step "the following Projects should be displayed in a list" do |table|
    table.hashes.each do |hash|
      page.should have_content hash['Name'].capitalize
      page.should have_content hash['Description']
    end
  end

  # Project's Detail Page

  step "the :project_name Project's Details are displayed" do |project_name|
    project = Project.find_by_name! project_name
    page.should have_content project.name.capitalize
    page.should have_content project.description
  end

  step "the Project Page displays showing :new_name and :new_description" do |new_name, new_description|
    page.should have_content new_name.capitalize
    page.should have_content new_description
  end

  # Edit Project Form

  step "the Edit Project Form is displayed populated with the values for Project :project_name" do |project_name|
    project = Project.find_by_name! project_name
    find_field('* Name').value.should eq project.name
    find_field('Description').value.should eq project.description
  end

  # New Project Form

  step "the New Project Form is displayed" do
    # TODO: this check throws a Capybara::ElementNotFound exception when the
    # field doesn't exist. Can these expectations be better written? (this
    # works anyway).
    page.should have_field('* Name')
    page.should have_field('Description')
    page.should have_button('Create Project')
  end

end
