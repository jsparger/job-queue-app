class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash[:alert] = t('user.not_authorized')
      render :file => "public/403", :status => :forbidden
    else
      flash[:alert] = t('user.login_first')
      render :file => "public/401", :status => :unauthorized
    end
  end
end
