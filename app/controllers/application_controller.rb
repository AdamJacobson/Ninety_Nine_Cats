class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    if user.nil?
      render json: "Invalid credentials"
    else
      sesh = user.reset_session_token!
      session[:session_token] = sesh
      redirect_to cats_url
    end
  end

  def logout!
    user = current_user
    if user
      user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to cats_url
  end
end
