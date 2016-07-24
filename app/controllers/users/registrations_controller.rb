class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
   end
 end
end
