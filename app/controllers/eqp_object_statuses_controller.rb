class EqpObjectStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_eqp_object_status, only: [:show, :edit, :update, :destroy]

  # GET /eqp_object_statuses
  # GET /eqp_object_statuses.json
  def index
    @eqp_object_statuses = EqpObjectStatus.all.order(seq: :asc)
  end

  # GET /eqp_object_statuses/1
  # GET /eqp_object_statuses/1.json
  def show
  end

  # GET /eqp_object_statuses/new
  def new
    @eqp_object_status = EqpObjectStatus.new
  end

  # GET /eqp_object_statuses/1/edit
  def edit
  end

  # POST /eqp_object_statuses
  # POST /eqp_object_statuses.json
  def create
    @eqp_object_status = EqpObjectStatus.new(eqp_object_status_params)

    respond_to do |format|
      if @eqp_object_status.save
        format.html { redirect_to edit_eqp_object_status_path(@eqp_object_status), notice: 'Eqp object status was successfully created.' }
        format.json { render :show, status: :created, location: @eqp_object_status }
      else
        format.html { render :new }
        format.json { render json: @eqp_object_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eqp_object_statuses/1
  # PATCH/PUT /eqp_object_statuses/1.json
  def update
    respond_to do |format|
      if @eqp_object_status.update(eqp_object_status_params)
        format.html { redirect_to edit_eqp_object_status_path(@eqp_object_status), notice: 'Eqp object status was successfully updated.' }
        format.json { render :show, status: :ok, location: @eqp_object_status }
      else
        format.html { render :edit }
        format.json { render json: @eqp_object_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eqp_object_statuses/1
  # DELETE /eqp_object_statuses/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eqp_object_status
      @eqp_object_status = EqpObjectStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eqp_object_status_params
      params.require(:eqp_object_status).permit(:seq, :status_code, :description, :avail_on_create, :not_used)
    end
end
