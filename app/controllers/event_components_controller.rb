class EventComponentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_component, only: [:show, :edit, :update, :destroy]

  # GET /event_components
  # GET /event_components.json
  def index
    @event_components = EventComponent.all
  end

  # GET /event_components/1
  # GET /event_components/1.json
  def show
  end

  # GET /event_components/new
  def new
    @event_component = EventComponent.new
  end

  # GET /event_components/1/edit
  def edit
  end

  # POST /event_components
  # POST /event_components.json
  def create
    @event_component = EventComponent.new(event_component_params)

    respond_to do |format|
      if @event_component.save
        format.html { redirect_to edit_event_component_path(@event_component), notice: 'Component code was successfully created.' }
        format.json { render :show, status: :created, location: @event_component }
      else
        format.html { render :new }
        format.json { render json: @event_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_components/1
  # PATCH/PUT /event_components/1.json
  def update
    respond_to do |format|
      if @event_component.update(event_component_params)
        format.html { redirect_to edit_event_component_path(@event_component), notice: 'Component code was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_component }
      else
        format.html { render :edit }
        format.json { render json: @event_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_components/1
  # DELETE /event_components/1.json
  def destroy
    @event_component.destroy
    respond_to do |format|
      format.html { redirect_to event_components_url, notice: 'Component code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_component
      @event_component = EventComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_component_params
      params.require(:event_component).permit(:code, :description, :not_used)
    end
end
