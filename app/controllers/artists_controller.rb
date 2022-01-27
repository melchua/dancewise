class ArtistsController < ApplicationController
  include VideosHelper
  before_action :require_admin, except: [:index, :show]
  before_action :set_artist, only: [:show, :update, :edit, :destroy]

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 20)
    @filterrific = initialize_filterrific(
      @Artist,
      params[:filterrific]
    ) or return
    @artists = @filterrific.find.page(params[:page])
 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist.first_video_id&.strip 
    @artist.youtube_embed_url
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
    params.require(:artist).permit(:name, :description, :image_url, :instructor, :dj, :first_video_id, :second_video_id, :third_video_id, dance_style_ids: [], event_ids: [])
  end

  # def youtube_embed_url
  #   # Taking the video ID of the YouTube URL from the video_id fields and then append the YouTube video ID to the https://www.youtube.com/embed/"YouTube Video ID"
  #   normal_url = self.first_video_id
  #   youtube_id = YOUTUBE_REGEX.match normal_url.to_str
  #   if youtube_id
  #     youtube_id[6] || youtube_id[5]
  #   end
  #   embed_url = "http://www.youtube.com/embed/#{ youtube_id[5] }"
  #   params[:artist][:first_video_id] = embed_url
  #   binding.pry 
  #   end

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
