# frozen_string_literal: true

class ArtistsController < ApplicationController
  include VideosHelper
  include ActionController::MimeResponds
  # before_action :require_admin, except: %i[index show new]
  before_action :set_artist, only: %i[show update edit destroy]
  before_action :require_user, except: %i[show index]

  # One of of the changes I made to fix the some of the errors was on line 12 to change @artists to Artist.

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 20)
    @filterrific = initialize_filterrific(
      Artist,
      params[:filterrific]
    ) or return
    @artists = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true)
    .where(artist_status_id: 1)
  end

  def new
    @artist = Artist.new
  end

  def show
    puts @artist
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save
      flash[:notice] = "Artist was successfully created"
      redirect_to @artist
    else
      render "new"
    end
  end

  def edit; end

  def update
    # youtube_embed_url
    @artist.user = current_user
    if @artist.update(artist_params)
      flash[:notice] = "Artist was successfully updated"
      redirect_to @artist
    else
      render "new"
    end
  end

  def destroy
    @artist.destroy
    flash[:notice] = "Artist was successfully deleted."
    redirect_to artists_path
  end

  def suggest_artist
    @artist = Artist.new
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :description, :image_url, :avatar, :instructor, :dj, :first_video_id, :second_video_id, :third_video_id, :artist_status_id,
                                 dance_style_ids: [], event_ids: [])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def require_admin
      unless logged_in? && current_user.admin?
        flash[:alert] = "Only admins can perform that action"
        redirect_to artists_path
      end
    end
end
