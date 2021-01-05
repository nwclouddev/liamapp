class EventPrioritiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_priority, only: [:show, :edit, :update, :destroy]

  # GET /event_priorities
  # GET /event_priorities.json
  def index
    @event_priorities = EventPriority.order(:seq)
  end

  # GET /event_priorities/1
  # GET /event_priorities/1.json
  def show
  end

  # GET /event_priorities/new
  def new
    @event_priority = EventPriority.new
  end

  # GET /event_priorities/1/edit
  def edit
  end

  # POST /event_priorities
  # POST /event_priorities.json
  def create
    @event_priority = EventPriority.new(event_priority_params)

    respond_to do |format|
      if @event_priority.save
        format.html { redirect_to edit_event_priority_path(@event_priority), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @event_priority }
      else
        format.html { render :new }
        format.json { render json: @event_priority.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_priorities/1
  # PATCH/PUT /event_priorities/1.json
  def update
    respond_to do |format|
      if @event_priority.update(event_priority_params)
        format.html { redirect_to edit_event_priority_path(@event_priority), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_priority }
      else
        format.html { render :edit }
        format.json { render json: @event_priority.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_priorities/1
  # DELETE /event_priorities/1.json
  def destroy
    @event_priority.destroy
    respond_to do |format|
      format.html { redirect_to event_priorities_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_priority
      @event_priority = EventPriority.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_priority_params
      params.require(:event_priority).permit(:seq, :description, :not_used)
    end
end
