def sign_in(opts = {})
  username = opts.fetch(:username, "user")
  password = opts.fetch(:password, "password")
  create(:user, opts.merge(username: username, password: password))
  visit login_path
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  click_on 'Log in!'
  page.should_not have_content 'Warning: There was a problem logging you in.' # Sanity check
end
