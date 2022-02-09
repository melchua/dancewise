class ArtistsController < ApplicationController
<<<<<<< Updated upstream
=======
  include VideosHelper
>>>>>>> Stashed changes
  before_action :require_admin, except: [:index, :show]
  before_action :set_artist, only: [:show, :update, :edit, :destroy]


  #One of of the changes I made to fix the some of the errors was on line 12 to change @artists to Artist.

  def index
<<<<<<< Updated upstream
    @artists = Artist.paginate(page: params[:page], per_page: 4)
=======
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
>>>>>>> Stashed changes
  end

  def new
    @artist = Artist.new
  end

  def show
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "Artist was successfully created"
      redirect_to @artist
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # youtube_embed_url
    if @artist.update(artist_params)
      flash[:notice] = "Artist was successfully updated"
      redirect_to @artist
    else
      render 'new'
    end
  end

  def destroy
    @artist.destroy
    flash[:notice] = "Artist was successfully deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :image_url, :instructor, :dj)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to artists_path
    end
  end

<<<<<<< Updated upstream
end
=======
end
>>>>>>> Stashed changes
