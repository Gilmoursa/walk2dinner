module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        session.delete(:cart_id)
        session.clear
        current_cart = nil
        current_user = nil
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def require_login
        unless logged_in? && params[:id] == session[:user_id].to_s
            flash[:error] = "You must be logged as this user to complete this action"
            redirect_to login_path
        end
    end

    def profile_of_current_user?(user)
        user.id == session[:user_id]
    end
end