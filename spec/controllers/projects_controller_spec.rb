require 'spec_helper'

describe ProjectsController do

  describe "GET 'create'" do

    it "creates a project when the parameters passed are correct" do
      post 'create', project: {
          name: 'Test new project',
          description: 'A test description',
      }
      projects_found = Project.where name: 'Test new project', description: 'A test description'
      expect(projects_found).to have_exactly(1).item
    end

    it "permits only parameters that the user can safely specify" do
      post 'create', project: {
          name: 'Test new project',
          description: 'A test description',
          created_at: '2000-01-01 01:01:01 +0200' # should be non permitted
      }
      projects_found = Project.where name: 'Test new project', description: 'A test description'
      expect(projects_found).to have_exactly(1).item
      expect(projects_found[0].created_at).not_to eq Time.zone.parse '2000-01-01 01:01:01 +0200'
    end

  end

end
