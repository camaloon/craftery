feature "Users management" do
  feature "sign up" do
    scenario do
      visit signup_path
      fill_in "Name", with: "Pepe"
      fill_in "Email", with: "pepe@ccacaca.com"
      fill_in "Username", with: "pepe"
      fill_in "* Password", with: "password", exact: true
      fill_in "Password confirmation", with: "password"
      fill_in "Username", with: "pepe"

      click_on "Sign up!"
      page.should have_text "User was successfully created."
    end
  end

  feature "Login" do
    given!(:user) { create :user, username: "pepe", password: "password" }

    scenario do
      visit login_path
      fill_in "Username", with: "pepe"
      fill_in "Password", with: "password"
      click_on "Log in!"
      page.should have_text "Log out"
    end
  end

  feature "Logout" do
    background { sign_in }
    scenario do
      click_on "Log out"
      page.should have_text "You just logged out."
    end
  end
end
