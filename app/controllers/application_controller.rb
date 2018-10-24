class ApplicationController < ActionController::Base

  helper_method :current_user

  def home
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def show_profile
  #   if current_user
  #     puts "Profile"
  #   else
  # end
  #
  # def show_login
  #   if !current_user
  #     puts "Login"
  #   end
  # end
end
