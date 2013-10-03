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
        feature: feature,
        contextual_id: contextual_id_from_code(us_data['Code'])
    }
  end
end

step "I visit the :route_human_name Page for User Story :user_story_code" do |route_human_name, user_story_code|
  user_story = UserStory.find_by_contextual_id! contextual_id_from_code(user_story_code)
  visit self.send(route_human_name_to_str(route_human_name), user_story)
end

step "I click the :link_name Link for User Story :user_story_code in the List" do |link_name, user_story_code|
  css_id_prefix = 'user_story_'
  id = id_from_contextual_id(contextual_id_from_code(user_story_code))
  within "##{css_id_prefix}#{id}" do
    click_on link_name
  end
end

## Expectations #############################################################

# User Story Detail Page

step "the :user_story_code User Story Details are displayed" do |user_story_code|
  user_story = UserStory.find_by_contextual_id! contextual_id_from_code(user_story_code)
  page.should have_content /(#{user_story.author.name.titleize}|#{user_story.author.username})/
  page.should have_content user_story.persona.name.titleize
  page.should have_content user_story.desire
  page.should have_content user_story.benefit
end

# Edit Feature Form

step "the Edit User Story Form is displayed populated with the values for User Story :user_story_code" do |user_story_code|
  user_story = UserStory.find_by_contextual_id! contextual_id_from_code(user_story_code)
  find_field('* As a').value.should eq user_story.persona.id.to_s
  find_field('* I want to').value.should eq user_story.desire
  find_field('* So I').value.should eq user_story.benefit
end

# New Feature Form

step "the New User Story Form is displayed" do
  # TODO: this check throws a Capybara::ElementNotFound exception when the
  # field doesn't exist. Can these expectations be better written? (this
  # works anyway).
  page.should have_field('* As a')
  page.should have_field('* I want to')
  page.should have_field('* So I')
  page.should have_button('Create User story')
end

## Helpers ####################################################################

def id_from_contextual_id(contextual_id)
  UserStory.find_by_contextual_id!(contextual_id).id
end

def contextual_id_from_code(code)
  code.from(2)
end
