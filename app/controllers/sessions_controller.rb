class SessionsController < ApplicationController
  def new
  end

  def create
    @nation = Nation.find_by(nation_name: params[:nation_name])
    if !@nation.nil? && @nation.authenticate(params[:password])
      session[:nation_id] = @nation.id
      redirect_to nation_path(@nation)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:nation_id)
    redirect_to login_path
  end
end
