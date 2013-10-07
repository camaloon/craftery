class FeaturesController < ApplicationController
  inherit_resources
  belongs_to :project, optional: true
  actions :all, except: :index

  protected

  def permitted_params
    params.permit(feature: [:name, :description, :state, :project_id])
  end

  def create_resource(r)
    r.owner = current_user
    super
  end

end
