class UserStoriesController < ApplicationController
  inherit_resources
  belongs_to :project do
    belongs_to :feature, optional: true
  end
  actions :all, except: :index

  protected

  def smart_collection_url
    [current_project, parent]
  end

  def permitted_params
    params.permit(user_story: [:persona_id, :desire, :benefit])
  end

  def create_resource(r)
    r.author = current_user
    super
  end
end
