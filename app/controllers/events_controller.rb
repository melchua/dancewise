class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :update]

  def new
    @event = Event.new
  end

  def edit
  end

  def show
  end

  def update
    if @event.update(event_params) 
      flash[:notice] = "Event was updated successfully"
      redirect_to @event
    else 
      render 'new'
    end
  end

  def index
    @events = Event.paginate(page: params[:page], per_page: 2)
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = "Event was created successfully."
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image_url, :type, :dance_type, :event_date)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
