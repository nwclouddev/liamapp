class EqpProfilesController < ApplicationController
  before_action :set_eqp_profile, only: [:show, :edit, :update, :destroy]

  # GET /eqp_profiles
  # GET /eqp_profiles.json
  def index
    @eqp_profiles = EqpProfile.page(params[:page]).includes(:eqp_object_class, 
                    :eqp_object_category, :eqp_object_criticality, :eqp_object_status)
    respond_to do |format|
      format.html { render :index }
      eqp_object_category = EqpObjectCategory.includes(:eqp_profiles).find(params[:eqp_object_category_id])
      format.json { render json: eqp_object_category.eqp_profiles.select(:code, :id).map { |eqp_profile| { id: eqp_profile.id, code: eqp_profile.code }}}
    end
  end

  # GET /eqp_profiles/1
  # GET /eqp_profiles/1.json
  def show
  end

  # GET /eqp_profiles/new
  def new
    @eqp_profile = EqpProfile.new
  end

  # GET /eqp_profiles/1/edit
  def edit
    @eqp_profile_pm_schedules = @eqp_profile.pm_schedules
  end

  # POST /eqp_profiles
  # POST /eqp_profiles.json
  def create
    @eqp_profile = EqpProfile.new(eqp_profile_params)

    respond_to do |format|
      if @eqp_profile.save
        format.html { redirect_to edit_eqp_profile_path(@eqp_profile), notice: 'Eqp profile was successfully created.' }
        format.json { render :show, status: :created, location: @eqp_profile }
      else
        format.html { render :new }
        format.json { render json: @eqp_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eqp_profiles/1
  # PATCH/PUT /eqp_profiles/1.json
  def update
    respond_to do |format|
      if @eqp_profile.update(eqp_profile_params)
        format.html { redirect_to edit_eqp_profile_path(@eqp_profile), notice: 'Eqp profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @eqp_profile }
      else
        format.html { render :edit }
        format.json { render json: @eqp_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eqp_profiles/1
  # DELETE /eqp_profiles/1.json
  def destroy
    @eqp_profile.destroy
    respond_to do |format|
      format.html { redirect_to eqp_profiles_url, notice: 'Eqp profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    count = EqpProfile.import(params[:file]).include(:eqp_object_classes, :eqp_object_categories)
    redirect_to eqp_profiles_path, notice: "Imported #{count} Equipment profiles"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eqp_profile
      @eqp_profile = EqpProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eqp_profile_params
      params.require(:eqp_profile).permit(:code, :description, :manufact, :manufact_model, :not_used,
                                          :eqp_object_class_id, :eqp_object_category_id, :eqp_object_status_id, 
                                          :eqp_object_criticality_id, :pm_plan_id)
    end
end
