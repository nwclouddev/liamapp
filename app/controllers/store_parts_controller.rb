class StorePartsController < ApplicationController

  before_action :set_store_part, only: [:show, :edit, :update, :destroy]

  def new
    @store_part = StorePart.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @store_part = StorePart.new(store_part_params)
    @store_part.organization_id = current_user.organization_id
    if @store_part.save
      redirect_to edit_store_part_path(@store_part), notice: 'Record was successfully created.'
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @store_part.update(store_part_params)
    if @store_part.save
      redirect_to edit_store_part_path(@store_part), notice: 'Record was successfully saved.'
    else
      render :edit
    end
  end

  def destroy
    @store_part.destroy
    redirect_to edit_store_path(@store_part.store), notice: 'Record was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_part
      @store_part = StorePart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_part_params
      params.require(:store_part).permit(:id, :part_id, :store_id, :min_qty, :max_qty, :organization_id, :bin_id, :stock_criticality_id, :supplier_id)  
    end

end