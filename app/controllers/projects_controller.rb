class ProjectsController < InheritedResources::Base

  respond_to :html

  def permitted_params
    params.permit(:project => [:name, :description])
  end

  def create
    create! { root_url }
  end

  def update
    update! { root_url }
  end

  def destroy
    destroy! { root_url }
  end

end
