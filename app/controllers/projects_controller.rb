class ProjectsController < ApplicationController
  inherit_resources

  actions :all, except: :index

  def collection_url
    root_url
  end

  def permitted_params
    params.permit(project: [:name, :description])
  end

end
