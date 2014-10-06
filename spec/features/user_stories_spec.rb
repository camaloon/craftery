feature "User stories" do
  given!(:project) { create :project }
  given!(:feature) { create :feature, project: project }
  given!(:persona) { create :persona, project: project, name: "Marketer"}

  background { sign_in }

  feature "Creation" do
    scenario do
      visit new_project_feature_user_story_path(project, feature)

      select "Marketer", from: "As a(n)"
      fill_in "I want to", with: "feature action"
      fill_in "So I", with: "feature value"

      click_on "Create User story"
      page.should have_text "User story was successfully created."
    end
  end

  feature "Edition" do
    given!(:user_story) { create :user_story, feature: feature }

    scenario do
      visit edit_project_feature_user_story_path(project, feature, user_story)
      select "Marketer", from: "As a(n)"
      fill_in "So I", with: "A new value"
      click_on "Update User story"

      page.should have_text "User story was successfully updated."
    end
  end

  feature "Deletion" do
    given!(:user_story) { create :user_story, feature: feature }

    scenario do
      visit project_feature_user_story_path(project, feature, user_story)
      find("a[title='Delete User Story']").click
      page.should have_text "User story was successfully destroyed."
    end
  end
end
