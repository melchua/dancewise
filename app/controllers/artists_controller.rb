class ArtistsController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_artist, only: [:show, :update, :edit, :destroy]

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 4)
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
    params.require(:artist).permit(:name, :description, :image_url, :instructor, :dj, dance_style_ids: [], event_ids: [])
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

end
