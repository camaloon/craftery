class ProjectsController < ApplicationController
  inherit_resources

  actions :all, except: :index
  alias_method :collection_url, :root_url

  def permitted_params
    params.permit(:project => [:name, :description])
  end

end
