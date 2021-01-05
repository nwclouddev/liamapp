class PartClassesController < ApplicationController
  before_action :set_part_class, only: [:show, :edit, :update, :destroy]

  # GET /part_classes
  # GET /part_classes.json
  def index
    @part_classes = PartClass.all
  end

  # GET /part_classes/1
  # GET /part_classes/1.json
  def show
  end

  # GET /part_classes/new
  def new
    @part_class = PartClass.new
  end

  # GET /part_classes/1/edit
  def edit
  end

  # POST /part_classes
  # POST /part_classes.json
  def create
    @part_class = PartClass.new(part_class_params)

    respond_to do |format|
      if @part_class.save
        format.html { redirect_to @part_class, notice: 'Part class was successfully created.' }
        format.json { render :show, status: :created, location: @part_class }
      else
        format.html { render :new }
        format.json { render json: @part_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_classes/1
  # PATCH/PUT /part_classes/1.json
  def update
    respond_to do |format|
      if @part_class.update(part_class_params)
        format.html { redirect_to @part_class, notice: 'Part class was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_class }
      else
        format.html { render :edit }
        format.json { render json: @part_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_classes/1
  # DELETE /part_classes/1.json
  def destroy
    @part_class.destroy
    respond_to do |format|
      format.html { redirect_to part_classes_url, notice: 'Part class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_class
      @part_class = PartClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_class_params
      params.require(:part_class).permit(:code, :not_used)
    end
end
