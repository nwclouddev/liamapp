class AhoyVisitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @ahoy_visits = Ahoy::Visit.all.order(started_at: :desc)
  end

end