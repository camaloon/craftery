module ProjectSteps

  ## Preconditions and Actions ################################################

  step "the following Projects exist in the system" do  |table|
    @projects = {}
    table.hashes.each do |hash|
      @projects[hash['Name']] = create :project, name: hash['Name'], description: hash['Description']
    end
  end

  # Home Page

  step "I visit the Home Page" do
    visit root_path
  end

  step "I click the :link_name Link for Project :project_name in the Project List" do |link_name, project_name|
    within_project_scope @projects[project_name] do
      click_on link_name
    end
  end

  # Project's Detail Page

  step "I visit the Project's Detail Page for Project :project_name" do |project_name|
    visit project_path @projects[project_name]
  end

  # New Project Form

  step "I visit the New Project Form" do
    visit new_project_path
  end

  # Edit Project Form

  step "I visit the Edit Project Form for Project :project_name" do |project_name|
    visit edit_project_path @projects[project_name]
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

  step "the Project Details Page displays showing :new_name and :new_description" do |new_name, new_description|
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
