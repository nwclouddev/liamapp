class PartUomsController < ApplicationController
  before_action :set_part_uom, only: [:show, :edit, :update, :destroy]

  # GET /part_uoms
  # GET /part_uoms.json
  def index
    @part_uoms = PartUom.all
  end

  # GET /part_uoms/1
  # GET /part_uoms/1.json
  def show
  end

  # GET /part_uoms/new
  def new
    @part_uom = PartUom.new
  end

  # GET /part_uoms/1/edit
  def edit
  end

  # POST /part_uoms
  # POST /part_uoms.json
  def create
    @part_uom = PartUom.new(part_uom_params)

    respond_to do |format|
      if @part_uom.save
        format.html { redirect_to @part_uom, notice: 'Part uom was successfully created.' }
        format.json { render :show, status: :created, location: @part_uom }
      else
        format.html { render :new }
        format.json { render json: @part_uom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_uoms/1
  # PATCH/PUT /part_uoms/1.json
  def update
    respond_to do |format|
      if @part_uom.update(part_uom_params)
        format.html { redirect_to @part_uom, notice: 'Part uom was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_uom }
      else
        format.html { render :edit }
        format.json { render json: @part_uom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_uoms/1
  # DELETE /part_uoms/1.json
  def destroy
    @part_uom.destroy
    respond_to do |format|
      format.html { redirect_to part_uoms_url, notice: 'Part uom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_uom
      @part_uom = PartUom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_uom_params
      params.require(:part_uom).permit(:code, :description, :not_used)
    end
end
