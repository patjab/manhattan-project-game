class NationsController < ApplicationController
  def new
    @nation = Nation.new
  end

  def index
    @nations = Nation.all
  end

  def create
    @nation = Nation.new(nation_params)
    if @nation.valid?
      @nation.save
      redirect_to nation_path(@nation)
    else
      redirect_to login_path
    end
  end

  def show
    @nation = Nation.find(params[:id])
  end

  private
  def nation_params
    params.require(:nation).permit(:nation_name, :password, :password_confirmation)
  end
end
