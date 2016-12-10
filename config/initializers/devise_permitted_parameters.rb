module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profession, :role, :about, :facebook_link, :vk_link, :google_link,
                                                              :phone_number, :avatar, :avatar_cache, :remove_avatar])
    devise_parameter_sanitizer.permit(:sign_out)
  end
end

DeviseController.send :include, DevisePermittedParameters
