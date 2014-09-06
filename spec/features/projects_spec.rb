feature "Project management" do
  feature "creation" do
    background { sign_in }

    scenario do
      visit new_project_path
      fill_in "Name", with: "a name"
      click_on "Create Project"
      page.should have_text "Project was successfully created."
    end
  end

  feature "edition" do
    background { sign_in }
    given!(:project) { create :project }

    scenario do
      visit edit_project_path(project)
      fill_in "Name", with: "a new name"
      fill_in "Description", with: "new description"
      click_on "Update Project"
      page.should have_text "Project was successfully updated."
    end
  end

  feature "deletion" do
    background { sign_in }
    given!(:project) { create :project }

    scenario do
      visit edit_project_path(project)
      click_on "Delete"
      page.should have_text "Project was successfully destroyed."
    end
  end
end
