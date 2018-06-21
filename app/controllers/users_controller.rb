class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.nation_name = params[:user][:nation_name].capitalize
    @user.save
    redirect_to matches_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params[:user][:user_name].nil? ? (params[:user][:user_name] = User.find(params[:id]).user_name) : nil
    params[:user][:user_name].capitalize!
    params.require(:user).permit(:user_name, :nation_name, :password, :password_confirmation)
  end
end
