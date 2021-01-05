class EventFailuresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_failure, only: [:show, :edit, :update, :destroy]

  # GET /event_failures
  # GET /event_failures.json
  def index
    @event_failures = EventFailure.all
  end

  # GET /event_failures/1
  # GET /event_failures/1.json
  def show
  end

  # GET /event_failures/new
  def new
    @event_failure = EventFailure.new
  end

  # GET /event_failures/1/edit
  def edit
  end

  # POST /event_failures
  # POST /event_failures.json
  def create
    @event_failure = EventFailure.new(event_failure_params)

    respond_to do |format|
      if @event_failure.save
        format.html { redirect_to edit_event_failure_path(@event_failure), notice: 'Evt failure code was successfully created.' }
        format.json { render :show, status: :created, location: @event_failure }
      else
        format.html { render :new }
        format.json { render json: @event_failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_failures/1
  # PATCH/PUT /event_failures/1.json
  def update
    respond_to do |format|
      if @event_failure.update(event_failure_params)
        format.html { redirect_to edit_event_failures_url(@event_failure), notice: 'Evt failure code was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_failure }
      else
        format.html { render :edit }
        format.json { render json: @event_failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_failures/1
  # DELETE /event_failures/1.json
  def destroy
    @event_failure.destroy
    respond_to do |format|
      format.html { redirect_to event_failures_url, notice: 'Evt failure code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_failure
      @event_failure = EventFailure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_failure_params
      params.require(:event_failure).permit(:code, :description, :not_used)
    end
end
