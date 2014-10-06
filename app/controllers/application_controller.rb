class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UserSessionHelpers

  def check_user_logged
    redirect_to login_path unless logged_in?
  end
  before_filter :check_user_logged

  def current_project
    @current_project ||= Project.find params[:project_id] if params[:project_id]
  end
  helper_method :current_project
end
