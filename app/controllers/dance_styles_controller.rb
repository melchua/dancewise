class DanceStylesController < ApplicationController
  def show
    @dance_style = DanceStyle.find(params[:id])
  end

  def new
    @dance_style = DanceStyle.new
  end

  def index
    @dance_styles = DanceStyle.all
  end

  def create
    @dance_style = DanceStyle.new(dance_style_params)
    if @dance_style.save
      flash[:notice] = "Dance style was successfully created"
      redirect_to @dance_style
    else 
      render 'new'
    end
  end

  private

  def dance_style_params
    params.require(:dance_style).permit(:name)
  end
end
