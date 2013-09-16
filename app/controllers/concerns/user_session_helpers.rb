module UserSessionHelpers
  extend ActiveSupport::Concern

  included { helper_method :current_user, :logged_in? }

  def set_current_user!(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def unset_current_user!
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
