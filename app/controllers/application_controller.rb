class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout?
  
   def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        if current_user.role == "admin"
        dashboards_path
       else
          home_index_path
       end
      end
  end

  def layout?
    if user_signed_in?
      if current_user.role == "admin"
      return "admin"
     else
      return "application"
    end
   end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit!}
  end
end
