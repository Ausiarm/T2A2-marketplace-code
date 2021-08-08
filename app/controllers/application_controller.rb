class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramters, if: :devise_controller?
  
  protected 
    def configure_permitted_paramters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

  private

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
end
