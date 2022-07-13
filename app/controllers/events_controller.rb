# frozen_string_literal: true

class EventsController < ApplicationController
  # order matters here
  before_action :set_event, only: %i[edit show update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @event = Event.new
  end

  def edit; end

  def show; end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event was updated successfully"
      redirect_to @event
    else
      render "new"
    end
  end

  def index
    if params[:q]
      params[:q][:combinator] = "and"
      params[:q][:groupings] = []
      split_geo = params[:q][:address_or_city_or_state_or_country_or_continent_cont_all].split(/[,\s]+/)
      split_geo.map! do |a|
        a.parameterize
      end
      params[:q][:address_or_city_or_state_or_country_or_continent_cont_all].clear
      split_geo.each_with_index do |word, index|
        params[:q][:groupings][index] = { address_or_city_or_state_or_country_or_continent_cont_all: word }
      end
    end


    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = "Event was created successfully."
      redirect_to @event
    else
      render "new"
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event was successfully deleted."
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :address, :event_image, :type, :event_date, :event_type_id,
                                    :event_frequency_id, dance_style_ids: [], artist_ids: [])
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def require_same_user
      if current_user != @event.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @event
      end
    end
end
