class EventEqpGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_eqp_group, only: [:show, :edit, :update, :destroy]

  # GET /event_eqp_groups
  # GET /event_eqp_groups.json
  def index
    @event_eqp_groups = EventEqpGroup.all
  end

  # GET /event_eqp_groups/1
  # GET /event_eqp_groups/1.json
  def show
  end

  # GET /event_eqp_groups/new
  def new
    @event_eqp_group = EventEqpGroup.new
  end

  # GET /event_eqp_groups/1/edit
  def edit
  end

  # POST /event_eqp_groups
  # POST /event_eqp_groups.json
  def create
    @event_eqp_group = EventEqpGroup.new(event_eqp_group_params)

    respond_to do |format|
      if @event_eqp_group.save
        format.html { redirect_to edit_event_eqp_group_path(@event_eqp_group), notice: 'Equipment code was successfully created.' }
        format.json { render :show, status: :created, location: @event_eqp_group }
      else
        format.html { render :new }
        format.json { render json: @event_eqp_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_eqp_groups/1
  # PATCH/PUT /event_eqp_groups/1.json
  def update
    respond_to do |format|
      if @event_eqp_group.update(event_eqp_group_params)
        format.html { redirect_to edit_event_eqp_group_path(@event_eqp_group), notice: 'Equipment code was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_eqp_group }
      else
        format.html { render :edit }
        format.json { render json: @event_eqp_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_eqp_groups/1
  # DELETE /event_eqp_groups/1.json
  def destroy
    @event_eqp_group.destroy
    respond_to do |format|
      format.html { redirect_to event_eqp_groups_url, notice: 'Equipment code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_eqp_group
      @event_eqp_group = EventEqpGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_eqp_group_params
      params.require(:event_eqp_group).permit(:code, :desc, :not_used)
    end
end
