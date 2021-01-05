class LaneTypesController < ApplicationController
  before_action :set_lane_type, only: [:show, :edit, :update, :destroy]

  # GET /lane_types
  # GET /lane_types.json
  def index
    @lane_types = LaneType.all
  end

  # GET /lane_types/1
  # GET /lane_types/1.json
  def show
  end

  # GET /lane_types/new
  def new
    @lane_type = LaneType.new
  end

  # GET /lane_types/1/edit
  def edit
  end

  # POST /lane_types
  # POST /lane_types.json
  def create
    @lane_type = LaneType.new(lane_type_params)

    respond_to do |format|
      if @lane_type.save
        format.html { redirect_to edit_lane_type_path(@lane_type), notice: 'Lane type was successfully created.' }
        format.json { render :show, status: :created, location: @lane_type }
      else
        format.html { render :new }
        format.json { render json: @lane_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lane_types/1
  # PATCH/PUT /lane_types/1.json
  def update
    respond_to do |format|
      if @lane_type.update(lane_type_params)
        format.html { redirect_to edit_lane_type_path(@lane_type), notice: 'Lane type was successfully updated.' }
        format.json { render :show, status: :ok, location: @lane_type }
      else
        format.html { render :edit }
        format.json { render json: @lane_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lane_types/1
  # DELETE /lane_types/1.json
  def destroy
    @lane_type.destroy
    respond_to do |format|
      format.html { redirect_to lane_types_url, notice: 'Lane type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lane_type
      @lane_type = LaneType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lane_type_params
      params.require(:lane_type).permit(:code, :description, :not_used)
    end
end
