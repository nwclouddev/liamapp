class EqpObjectCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_eqp_object_category, only: [:show, :edit, :update, :destroy]

  # GET /eqp_object_categories
  # GET /eqp_object_categories.json
  def index
    @eqp_object_categories = EqpObjectCategory.page(params[:page]).includes(:eqp_object_class).order(code: :asc)
  end

  # GET /eqp_object_categories/1
  # GET /eqp_object_categories/1.json
  def show
  end

  # GET /eqp_object_categories/new
  def new
    @eqp_object_category = EqpObjectCategory.new
  end

  # GET /eqp_object_categories/1/edit
  def edit
  end

  # POST /eqp_object_categories
  # POST /eqp_object_categories.json
  def create
    @eqp_object_category = EqpObjectCategory.new(eqp_object_category_params)

    respond_to do |format|
      if @eqp_object_category.save
        format.html { redirect_to edit_eqp_object_category_path(@eqp_object_category), notice: 'Record was successfully saved.' }
        format.json { render :show, status: :created, location: @eqp_object_category }
      else
        format.html { render :new }
        format.json { render json: @eqp_object_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eqp_object_categories/1
  # PATCH/PUT /eqp_object_categories/1.json
  def update
    respond_to do |format|
      if @eqp_object_category.update(eqp_object_category_params)
        format.html { redirect_to edit_eqp_object_category_path(@eqp_object_category), notice: 'Record was successfully saved.' }
        format.json { render :show, status: :ok, location: @eqp_object_category }
      else
        format.html { render :edit }
        format.json { render json: @eqp_object_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eqp_object_categories/1
  # DELETE /eqp_object_categories/1.json
  def destroy

  end

  def import
    count = EqpObjectCategory.import params[:file]
    redirect_to eqp_object_categories_path, notice: "Imported #{count} Equipment Categories"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eqp_object_category
      @eqp_object_category = EqpObjectCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eqp_object_category_params
      params.require(:eqp_object_category).permit(:code, :description, :eqp_object_class_id, :not_used)
    end
end
