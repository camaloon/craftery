class PersonasController < ApplicationController
  inherit_resources
  belongs_to :project, optional: true
  actions :all, except: [:index, :show]

  # TODO: delete should redirect to parent project

  protected

  def permitted_params
    params.permit(persona: [:name, :project_id])
  end

end
