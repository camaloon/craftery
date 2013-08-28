class ProjectsController < InheritedResources::Base

  def permitted_params
    params.permit(:project => [:name])
  end

end
