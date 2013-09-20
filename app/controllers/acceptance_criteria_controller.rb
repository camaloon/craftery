class AcceptanceCriteriaController < ApplicationController
  inherit_resources
  belongs_to :user_story, optional: true
  actions :all, except: :index

  protected

  def collection_url
    root_url
  end

  def permitted_params
    params.permit(acceptance_criterion: [:author_id, :description, :state, :user_story_id])
  end

  def create_resource(r)
    r.author = current_user
    super
  end

end
