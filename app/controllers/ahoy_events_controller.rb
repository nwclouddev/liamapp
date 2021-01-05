class AhoyEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:destroy]
  def index
    @ahoy_events = Ahoy::Event.all.order(time: :desc)
  end

  def destroy
    @ahoy_event.destroy
    respond_to do |format|
      format.html { redirect_to ahoy_events_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @ahoy_event = Ahoy::Event.find(params[:id])
    end

    def event_params
      params.require(:ahoy_event).permit(:id)
    end
end