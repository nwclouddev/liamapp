class FunctionalAreasController < ApplicationController
  before_action :set_functional_area, only: [:show, :edit, :update, :destroy]

  # GET /functional_areas
  # GET /functional_areas.json
  def index
    @functional_areas = FunctionalArea.all
  end

  # GET /functional_areas/1
  # GET /functional_areas/1.json
  def show
  end

  # GET /functional_areas/new
  def new
    @functional_area = FunctionalArea.new
  end

  # GET /functional_areas/1/edit
  def edit
  end

  # POST /functional_areas
  # POST /functional_areas.json
  def create
    @functional_area = FunctionalArea.new(functional_area_params)

    respond_to do |format|
      if @functional_area.save
        format.html { redirect_to edit_functional_area_path(@functional_area), notice: 'Functional area was successfully created.' }
        format.json { render :show, status: :created, location: @functional_area }
      else
        format.html { render :new }
        format.json { render json: @functional_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functional_areas/1
  # PATCH/PUT /functional_areas/1.json
  def update
    respond_to do |format|
      if @functional_area.update(functional_area_params)
        format.html { redirect_to edit_functional_area_path(@functional_area), notice: 'Functional area was successfully updated.' }
        format.json { render :show, status: :ok, location: @functional_area }
      else
        format.html { render :edit }
        format.json { render json: @functional_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_areas/1
  # DELETE /functional_areas/1.json
  def destroy
    @functional_area.destroy
    respond_to do |format|
      format.html { redirect_to functional_areas_url, notice: 'Functional area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_functional_area
      @functional_area = FunctionalArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def functional_area_params
      params.require(:functional_area).permit(:code, :description, :not_used)
    end
end
