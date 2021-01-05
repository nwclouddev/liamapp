class EventProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_problem, only: [:show, :edit, :update, :destroy]

  # GET /event_problems
  # GET /event_problems.json
  def index
    @event_problems = EventProblem.all
  end

  # GET /event_problems/1
  # GET /event_problems/1.json
  def show
  end

  # GET /event_problems/new
  def new
    @event_problem = EventProblem.new
  end

  # GET /event_problems/1/edit
  def edit
  end

  # POST /event_problems
  # POST /event_problems.json
  def create
    @event_problem = EventProblem.new(event_problem_params)

    respond_to do |format|
      if @event_problem.save
        format.html { redirect_to edit_event_problem_path(@event_problem), notice: 'Problem code was successfully created.' }
        format.json { render :show, status: :created, location: @event_problem }
      else
        format.html { render :new }
        format.json { render json: @event_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_problems/1
  # PATCH/PUT /event_problems/1.json
  def update
    respond_to do |format|
      if @event_problem.update(event_problem_params)
        format.html { redirect_to edit_event_problem_path(@event_problem), notice: 'Problem code was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_problem }
      else
        format.html { render :edit }
        format.json { render json: @event_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_problems/1
  # DELETE /event_problems/1.json
  def destroy
    @event_problem.destroy
    respond_to do |format|
      format.html { redirect_to event_problems_url, notice: 'Problem code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_problem
      @event_problem = EventProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_problem_params
      params.require(:event_problem).permit(:code, :description, :not_used)
    end
end
