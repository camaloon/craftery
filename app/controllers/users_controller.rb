class UsersController < ApplicationController
  inherit_resources

  skip_before_filter :check_user_logged, only: [:new, :create]

  def permitted_params
    params.permit(:user => [:name, :email, :username, :password, :password_confirmation])
  end

  def create
    create! { root_url }
    session[:user_id] = @user.id
  end

end
