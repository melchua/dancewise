class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = User.first
    if @event.save
      flash[:notice] = "Event was created successfully."
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image_url, :type, :dance_type)
  end

end
