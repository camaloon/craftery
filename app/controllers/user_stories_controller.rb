class UserStoriesController < ApplicationController
  inherit_resources
  belongs_to :feature, optional: true
  actions :all, except: :index

  protected

  alias_method :collection_url, :root_url # TODO: change this to feature_url (param?)

  def permitted_params
    params.permit(:user_story => [:author_id, :persona_id, :desire, :benefit, :feature_id])
  end

  def create_resource(r)
    r.author = current_user
    super
  end

end
