class ProjectsController < InheritedResources::Base

  respond_to :html

  actions :all, except: :index
  alias_method :collection_url, :root_url

  def permitted_params
    params.permit(:project => [:name, :description])
  end

end
