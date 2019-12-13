class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :login_user!

    def current_user
        user = User.find_by(session_token: session[:session_token])
        return nil unless user 
        user
    end

    def login_user!
        @current_user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        session[:session_token] = @current_user.reset_session_token!
    end

    def redirect_to_index
        redirect_to cats_url if current_user
    end

    def require_user
        if current_user.nil?
            redirect_to new_session_url
        end 
    end 
end
