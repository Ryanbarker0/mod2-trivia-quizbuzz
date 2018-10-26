class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    @user = user.try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to feed_path
    else
      flash[:message] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end



  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
