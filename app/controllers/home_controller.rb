class HomeController < ApplicationController

  def home
    @projects = Project.all
  end

end
