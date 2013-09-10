module ProjectSteps

  ## Preconditions and Actions ################################################

  step "the following Projects exist in the system" do  |table|
    @projects ||= {}
    table.hashes.each do |hash|
      @projects[hash['Name']] = create :project, name: hash['Name'], description: hash['Description']
    end
  end

  step "I visit the :route_human_name Page for Project :project_name" do |route_human_name, project_name|
    visit self.send(route_human_name_to_str(route_human_name), @projects[project_name])
  end

  step "I click the :link_name Link for Project :project_name in the Project List" do |link_name, project_name|
    within_project_scope @projects[project_name] do
      click_on link_name
    end
  end

  ## Expectations #############################################################

  # Home

  step "the following Projects should be displayed in a list" do |table|
    table.hashes.each do |hash|
      page.should have_content hash['Name'].capitalize
      page.should have_content hash['Description']
    end
  end

  # Project's Detail Page

  step "the :project_name Project's Details are displayed" do |project_name|
    page.should have_content @projects[project_name].name.capitalize
  end

  step "the Project Page displays showing :new_name and :new_description" do |new_name, new_description|
    page.should have_content new_name.capitalize
    page.should have_content new_description
  end

  # Edit Project Form

  step "the Edit Project Form is displayed populated with the values for Project :project_name" do |project_name|
    find_field('* Name').value.should eq @projects[project_name].name
    find_field('Description').value.should eq @projects[project_name].description
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

  ## Helpers ##################################################################

  def within_project_scope(project, &block)
    within "#project-#{project.id}", &block
  end

end
