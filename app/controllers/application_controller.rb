class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    puts "OH NO CANCAN ACCESS DENIED"
    if user_signed_in?
      flash[:alert] = t('user.not_authorized')
      render :file => "public/403", :status => :forbidden
    else
      flash[:alert] = t('user.login_first')
      redirect_to user_session_path, :status => :unauthorized
    end
  end
  
  # disable CSRF token check for JSON requests
  def verified_request?
      if request.content_type == "application/json"
        true
      else
        super()
      end
  end
end
