class SessionsController < ApplicationController

  skip_before_filter :check_user_logged, only: [:new, :create]
  skip_before_filter :verify_authenticity_token, only: [:new, :create]

  def permitted_params
    params.permit(:session => [:username, :password])
  end

  def create
    if user = User.find_by_username(params[:session][:username])
      if user.authenticate params[:session][:password]
        set_current_user!(user)
      end
    end

    if logged_in?
      redirect_to root_path
    else
      flash.now[:alert] = "There was a problem logging you in. Incorrect username or password?"
      render action: :new
    end
  end

  def destroy
    unset_current_user!
    redirect_to root_path
  end
end
