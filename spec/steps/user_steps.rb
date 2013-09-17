module UserSteps

  ## Preconditions and Actions ################################################

  step "there is a user in the system that has the following data" do |table|
    user_data = table.hashes.first
    create :user,
      username: user_data['Username'],
      name: user_data['Name'],
      password: user_data['Password'],
      password_confirmation: user_data['Password'],
      email: user_data['Email']
  end

  step "I am identified in the system as :username using password :password" do |username, password|
    visit login_path
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Log in!'
    page.should_not have_content 'Warning: There was a problem logging you in.' # Sanity check
  end

  step "I should be informed that I successfully logged in" do
    page.should have_content 'Log out'
  end

end
