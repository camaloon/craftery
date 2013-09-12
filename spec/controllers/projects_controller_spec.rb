require 'spec_helper'

describe ProjectsController do

  describe "GET 'create'" do

    it "creates a project when the parameters passed are correct" do
      post 'create', project: {
          name: 'Test new project',
          description: 'A test description',
      }
      projects_found = Project.where name: 'Test new project', description: 'A test description'
      projects_found.should have_exactly(1).item
    end

    it "permits only parameters that the user can safely specify" do

      t_now = Time.zone.parse '2001-01-01 01:01:01 +0100'
      t_malicious = Time.zone.parse '2002-02-02 02:02:02 +0200'

      Timecop.freeze(t_now) do

        post 'create', project: {
            name: 'Test new project',
            description: 'A test description',
            created_at: t_malicious # should be non permitted
        }
        projects_found = Project.where name: 'Test new project', description: 'A test description'
        projects_found.should have_exactly(1).item
        projects_found.first.created_at.should eq t_now

      end

    end

  end

end
