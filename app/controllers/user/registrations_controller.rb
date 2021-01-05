class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :email, :organization_id, :permission_group_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :email, :organization_id, :permission_group_id])
  end
  
end