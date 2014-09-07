feature "Features management" do
  background { sign_in }

  feature "Creation" do
    given!(:project) { create :project }

    scenario do
      visit project_path(project)
      click_on "New Feature"

      fill_in "Name", with: "Feature one"
      fill_in "Description", with: "Description"

      click_on "Create Feature"

      page.should have_text "Feature was successfully created."
    end
  end

  feature "Edition" do
    given!(:project) { create :project }
    given!(:feature) { create :feature, project: project }

    scenario do
      visit edit_feature_path(feature)
      fill_in "Name", with: "New name"
      fill_in "Description", with: "New description"
      click_on "Update Feature"
      page.should have_text "Feature was successfully updated."
    end
  end

  feature "Deletion" do
    given!(:project) { create :project }
    given!(:feature) { create :feature, project: project }

    scenario do
      visit feature_path(feature)
      click_on "Delete"
      page.should have_text "Feature was successfully destroyed."
    end
  end
end
