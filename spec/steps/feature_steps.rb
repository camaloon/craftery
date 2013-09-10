module FeatureSteps

  ## Preconditions and Actions ################################################

  step "the project :project_name has the following Features" do |project_name, table|
    @features ||= {}
    @features[project_name] ||= {}
    table.hashes.each do |hash|
      owner = User.find_by_username hash['Owner']
      @features[project_name][hash['Name']] = create :feature, name: hash['Name'], owner: owner, state: hash['State'], description: hash['Description']
    end
  end

  ## Expectations #############################################################

  # Features list

  step "the following Features should be displayed in a list" do |table|
    table.hashes.each do |hash|
      page.should have_content hash['Name'].capitalize
      page.should have_content hash['Owner']
      page.should have_content hash['State']
      page.should have_content hash['Description']
    end
  end

end
