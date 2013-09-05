module ProjectSteps

  step 'there are a couple of projects in the system' do
    create :project, name: 'test project 1'
    create :project, name: 'test project 2'
  end

  step 'a user visits the home page' do
    visit root_path
  end

  step 'the list of projects should be displayed' do
    expect(page).to have_content 'Test project 1'
    expect(page).to have_content 'Test project 2'
  end

  step "a user fills the new project form" do
    visit new_project_path
    fill_in '* Name', with: 'new project test'
    click_button 'Create Project'
  end

  step 'a new project should be created' do
    expect(page).to have_content 'Success'
  end

end
