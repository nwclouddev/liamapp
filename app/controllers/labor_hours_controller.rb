class LaborHoursController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  private

    def labor_hour_params
      params.require(:labor_hour).permit(:user_id, :hours, :date_worked, :description)
    end



end