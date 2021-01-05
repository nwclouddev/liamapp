class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  if Rails.env == 'production'
    after_action :track_action
  end

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

end
