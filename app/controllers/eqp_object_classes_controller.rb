class EqpObjectClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!
  before_action :set_eqp_object_class, only: [:show, :edit, :update, :destroy]

  def index
    @eqp_object_classes = EqpObjectClass.all
    respond_to do |format|
      format.html { 
        @eqp_object_classes = EqpObjectClass.page(params[:page]).order(code: :asc)
        render :index 
      }
      format.csv { send_data @eqp_object_classes.to_csv, filename: "eqp_object_classes-#{Date.today}.csv" }
    end
  end


  def show
  end

  # GET /eqp_object_classes/new
  def new
    @eqp_object_class = EqpObjectClass.new
  end

  # GET /eqp_object_classes/1/edit
  def edit
  end

  # POST /eqp_object_classes
  # POST /eqp_object_classes.json
  def create
    @eqp_object_class = EqpObjectClass.new(eqp_object_class_params)
    @eqp_object_class.not_used = false
    respond_to do |format|
      if @eqp_object_class.save
        format.html { redirect_to edit_eqp_object_class_path(@eqp_object_class), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @eqp_object_class }
      else
        format.html { render :new }
        format.json { render json: @eqp_object_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eqp_object_classes/1
  # PATCH/PUT /eqp_object_classes/1.json
  def update
    respond_to do |format|
      if @eqp_object_class.update(eqp_object_class_params)
        format.html { redirect_to edit_eqp_object_class_path(@eqp_object_class), notice: 'Record was successfully saved.' }
        format.json { render :show, status: :ok, location: @eqp_object_class }
      else
        format.html { render :edit }
        format.json { render json: @eqp_object_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eqp_object_classes/1
  # DELETE /eqp_object_classes/1.json
  def destroy

  end

  def import
    count = EqpObjectClass.import params[:file]
    redirect_to eqp_object_classes_path, notice: "Imported #{count} Equipment Classes"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eqp_object_class
      @eqp_object_class = EqpObjectClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eqp_object_class_params
      params.require(:eqp_object_class).permit(:code, :description, :not_used)
    end

end
