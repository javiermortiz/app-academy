class ApplicationController < ActionController::Base
    helper_method :log_in, :log_out!, :current_user, :logged_in?

    def log_in(user)
        session[:session_token] = user.ensure_session_token  # if it doesn't work change to reset_token
    end 

    def log_out!(user)
      user.reset_token!
      session[:session_token] = nil 
    end

    def current_user
      @current_user = User.find_by(session_token: session[:session_token])
      return nil unless @current_user
      @current_user
    end

    def logged_in?
      !!current_user
    end

    def require_log_in
      if !logged_in? 
        flash[:errors] = ["You gotta be logged in homeboi"]
        redirect_to new_session_url  
      end
    end
end
