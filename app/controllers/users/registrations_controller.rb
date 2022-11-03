class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile])
  end
  
 

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end



end
