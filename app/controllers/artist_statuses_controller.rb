# frozen_string_literal: true

class ArtistStatusesController < ApplicationController
  before_action :set_artist_status, only: %i[ show edit update destroy ]

  # GET /artist_statuses or /artist_statuses.json
  def index
    @artist_statuses = ArtistStatus.all
  end

  # GET /artist_statuses/1 or /artist_statuses/1.json
  def show
  end

  # GET /artist_statuses/new
  def new
    @artist_status = ArtistStatus.new
  end

  # GET /artist_statuses/1/edit
  def edit
  end

  # POST /artist_statuses or /artist_statuses.json
  def create
    @artist_status = ArtistStatus.new(artist_status_params)

    respond_to do |format|
      if @artist_status.save
        format.html { redirect_to artist_status_url(@artist_status), notice: "Artist status was successfully created." }
        format.json { render :show, status: :created, location: @artist_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_statuses/1 or /artist_statuses/1.json
  def update
    respond_to do |format|
      if @artist_status.update(artist_status_params)
        format.html { redirect_to artist_status_url(@artist_status), notice: "Artist status was successfully updated." }
        format.json { render :show, status: :ok, location: @artist_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_statuses/1 or /artist_statuses/1.json
  def destroy
    @artist_status.destroy

    respond_to do |format|
      format.html { redirect_to artist_statuses_url, notice: "Artist status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_status
      @artist_status = ArtistStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_status_params
      params.require(:artist_status).permit(:status, :artist_id)
    end
end
