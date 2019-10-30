class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	flash[:notice] = 'successfully'
    user_path(current_user)
  end
   def after_sign_up_path_for(resource)
   	flash[:notice] = 'successfully'
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
  	flash[:alert] = 'successfully'
    root_path
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

  def corrent_user(user)
  	if current_user.nil?
  		return false
  	else
  		user.id.equal?(current_user)
  	end
  end

end
