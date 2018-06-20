class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to match_path(current_user)
    end
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to matches_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
