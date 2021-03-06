class ApplicationController < ActionController::Base
  before_action :set_locale
  include SessionsHelper
  include MessagesHelper
  include ApplicationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :avatar, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = t "login"
    redirect_to new_user_session_url
  end

  def followed_user
    unless current_user? @user
      if current_user.following? @user
       else
        store_location
        flash[:danger] = t "checkfollow"
        redirect_to user_url
       end
    end
  end
end
