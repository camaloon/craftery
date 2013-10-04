## Preconditions and Actions ################################################

step "the project :project_name has the following Personas defined" do |project_name, table|
  project = Project.find_by_name project_name
  table.hashes.each do |persona_data|
    create :persona, name: persona_data['Name'], project: project
  end
end

step "the feature :feature_name has the following User Stories" do |feature_name, table|
  feature = Feature.find_by_name feature_name
  table.hashes.each do |us_data|
    author = User.find_by_username us_data['Author']
    persona = Persona.find_by_name us_data['Persona']
    create :user_story, {
        author: author,
        persona: persona,
        desire: us_data['Desire'],
        benefit: us_data['Benefit'],
        feature: feature
    }
  end
end
