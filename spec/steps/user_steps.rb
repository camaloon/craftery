

  ## Preconditions and Actions ################################################

  step "the following Users exist in the system" do |table|
    table.hashes.each do |user_data|
      create_overrides = {}
      user_data.each do |key, value|
        key = key.downcase
        if key == 'password'
          create_overrides[:password] = create_overrides[:password_confirmation] = value
        else
          create_overrides[key.to_sym] = value
        end
      end
      create :user, create_overrides
    end
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
