# frozen_string_literal: true

class DanceStylesController < ApplicationController
  before_action :require_user , except: %i[index show]

  def show
    @dance_style = DanceStyle.find(params[:id])
  end

  def new
    @dance_style = DanceStyle.new
  end

  def edit
    @dance_style = DanceStyle.find(params[:id])
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
      render "new"
    end
  end

  def update
    respond_to do |format|
      if @dance_style.update(dance_style_params)
        format.html { redirect_to dance_style_url(@dance_style_type), notice: "Dance style was successfully updated." }
        format.json { render :show, status: :ok, location: @dance_style }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dance_style.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def dance_style_params
      params.require(:dance_style).permit(:name)
    end

    def require_admin
      unless logged_in? && current_user.admin?
        flash[:alert] = "Only admins can perform that action"
        redirect_to dance_styles_path
      end
    end
end
