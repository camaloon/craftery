class PersonasController < ApplicationController
  inherit_resources
  belongs_to :project
  actions :all, except: [:show, :destroy]

  protected

  def permitted_params
    params.permit(persona: [:name])
  end
end
