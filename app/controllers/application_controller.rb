class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_nation
  before_action :logged_in?

  def current_nation
    if session[:nation_id]
      @nation = Nation.find(session[:nation_id])
    end
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_nation
  end
end
