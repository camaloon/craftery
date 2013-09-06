module ProjectSteps

  ## Preconditions and Actions ################################################

  step 'there are a couple of Projects in the system' do
    @project1 = create :project, name: 'test project 1', description: 'test project 1 description'
    @project2 = create :project, name: 'test project 2', description: 'test project 2 description'
  end

  # Home Page

  step 'a User visits the Home Page' do
    visit root_path
  end

  step 'clicks the New Project link' do
    click_on 'New Project'
  end

  step 'clicks on a Project link in the Project List' do
    click_on @project1.name.capitalize
  end

  step 'clicks on an Edit Project Link in the Project List' do
    within_project_scope @project1 do
      click_on 'Edit Project'
    end
  end

  # Project's Detail Page

  step 'a User visits the Project\'s Detail Page for a given Project' do
    visit project_path @project1
  end

  step 'clicks on the Edit Project Link' do
    click_on 'Edit'
  end

  step 'clicks on the Delete Project Link' do
    click_on 'Delete'
  end

  # New Project Form

  step "a User visits and fills the New Project Form" do
    visit new_project_path
    fill_in '* Name', with: 'new project test'
    click_on 'Create Project'
  end

  # Edit Project Form

  step 'a User visits and modifies some values in the Edit Project Form and saves' do
    visit edit_project_path @project1
    fill_in '* Name', with: 'edited name'
    fill_in 'Description', with: 'edited description'
    click_on 'Update Project'
  end

  ## Expectations #############################################################

  step 'the User is informed of the operation\'s success' do
    expect(page).to have_content 'Success'
  end

  # Home

  step 'the List of Projects should be displayed' do
    expect(page).to have_content 'Test project 1'
    expect(page).to have_content 'test project 1 description'
    expect(page).to have_content 'Test project 2'
    expect(page).to have_content 'test project 2 description'
  end

  # Project's Detail Page

  step 'the Project details are displayed' do
    expect(page).to have_content @project1.name.capitalize
  end

  step 'the Project Details Page displays with the updated data' do
    expect(page).to have_content 'Edited name'
    expect(page).to have_content 'edited description'
  end

  # Edit Project Form

  step 'the Edit Project Form is displayed populated with the Project\'s values' do
    expect(find_field('* Name').value).to eq @project1.name
    expect(find_field('Description').value).to eq @project1.description
  end

  # New Project Form

  step 'the New Project Form is displayed' do
    # TODO: this check throws a Capybara::ElementNotFound exception when the
    # field doesn't exist. Can these expectations be better written? (this
    # works anyway).
    expect(find_field('* Name')).not_to be_nil
    expect(find_field('Description')).not_to be_nil
    expect(find_button('Create Project')).not_to be_nil
  end

  ## Helpers ##################################################################

  def within_project_scope(project, &block)
    within "#project-#{project.id}", &block
  end

end
