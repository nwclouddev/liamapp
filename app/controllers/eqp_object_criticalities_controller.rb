class EqpObjectCriticalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_eqp_object_criticality, only: [:show, :edit, :update, :destroy]

  # GET /eqp_object_criticalities
  # GET /eqp_object_criticalities.json
  def index
    @eqp_object_criticalities = EqpObjectCriticality.all
  end

  # GET /eqp_object_criticalities/1
  # GET /eqp_object_criticalities/1.json
  def show
  end

  # GET /eqp_object_criticalities/new
  def new
    @eqp_object_criticality = EqpObjectCriticality.new
  end

  # GET /eqp_object_criticalities/1/edit
  def edit
  end

  # POST /eqp_object_criticalities
  # POST /eqp_object_criticalities.json
  def create
    @eqp_object_criticality = EqpObjectCriticality.new(eqp_object_criticality_params)

    respond_to do |format|
      if @eqp_object_criticality.save
        format.html { redirect_to edit_eqp_object_criticality_path(@eqp_object_criticality), notice: 'Eqp object criticality was successfully saved.' }
        format.json { render :show, status: :created, location: @eqp_object_criticality }
      else
        format.html { render :new }
        format.json { render json: @eqp_object_criticality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eqp_object_criticalities/1
  # PATCH/PUT /eqp_object_criticalities/1.json
  def update
    respond_to do |format|
      if @eqp_object_criticality.update(eqp_object_criticality_params)
        format.html { redirect_to edit_eqp_object_criticality_path(@eqp_object_criticality), notice: 'Eqp object criticality was successfully saved.' }
        format.json { render :show, status: :ok, location: @eqp_object_criticality }
      else
        format.html { render :edit }
        format.json { render json: @eqp_object_criticality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eqp_object_criticalities/1
  # DELETE /eqp_object_criticalities/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eqp_object_criticality
      @eqp_object_criticality = EqpObjectCriticality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eqp_object_criticality_params
      params.require(:eqp_object_criticality).permit(:seq, :description, :not_used)
    end
end
