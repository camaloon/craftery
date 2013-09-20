class BusinessGoalsController < ApplicationController
  inherit_resources
  belongs_to :feature, optional: true
  actions :all, except: :index

  protected

  def collection_url
    root_url
  end

  def permitted_params
    params.permit(business_goal: [:author_id, :description, :state, :feature_id])
  end

  def create_resource(r)
    r.author = current_user
    super
  end

end
