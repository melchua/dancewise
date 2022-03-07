class EventFrequenciesController < ApplicationController
  before_action :set_event_frequency, only: %i[ show edit update destroy ]

  # GET /event_frequencies or /event_frequencies.json
  def index
    @event_frequencies = EventFrequency.all
  end

  # GET /event_frequencies/1 or /event_frequencies/1.json
  def show
    @event_frequencies = EventFrequency.find(params[:id])
    @event_frequency_name = @event_frequencies.name
  end

  # GET /event_frequencies/new
  def new
    @event_frequency = EventFrequency.new
  end

  # GET /event_frequencies/1/edit
  def edit
  end

  # POST /event_frequencies or /event_frequencies.json
  def create
    @event_frequency = EventFrequency.new(event_frequency_params)

    respond_to do |format|
      if @event_frequency.save
        format.html { redirect_to event_frequency_url(@event_frequency), notice: "Event frequency was successfully created." }
        format.json { render :show, status: :created, location: @event_frequency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_frequencies/1 or /event_frequencies/1.json
  def update
    respond_to do |format|
      if @event_frequency.update(event_frequency_params)
        format.html { redirect_to event_frequency_url(@event_frequency), notice: "Event frequency was successfully updated." }
        format.json { render :show, status: :ok, location: @event_frequency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_frequencies/1 or /event_frequencies/1.json
  def destroy
    @event_frequency.destroy

    respond_to do |format|
      format.html { redirect_to event_frequencies_url, notice: "Event frequency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_frequency
      @event_frequency = EventFrequency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_frequency_params
      params.require(:event_frequency).permit(:name)
    end
end
