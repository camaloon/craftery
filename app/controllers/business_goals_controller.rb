class BusinessGoalsController < ApplicationController
  inherit_resources
  belongs_to :feature, optional: true
  actions :all, except: :index

  protected

  alias_method :collection_url, :root_url # TODO: change this to feature_url (param?)
                                          # TODO: create should redirect to show as update does

  def permitted_params
    params.permit(business_goal: [:author_id, :description, :state, :feature_id])
  end

  def create_resource(r)
    r.author = current_user
    super
  end

end
