class EventsController < ApplicationController
  # order matters here
  before_action :set_event, only: [:edit, :show, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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
    @events = Event.paginate(page: params[:page], per_page: 20)
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

  def destroy
    @event.destroy
    flash[:notice] = "Event was successfully deleted."
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image_url, :type, :event_date, :event_type_id, :event_frequency_id, dance_style_ids: [], artist_ids: [])
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
