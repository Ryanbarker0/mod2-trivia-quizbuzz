class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to categories_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:current_password] == @user.password
      @user.update(user_update_params)
      flash.now[:success] = "Your changes have been saved"
      redirect_to user_url(@user)
    else
      flash[:errors] = "Current Password Is Incorrect"
      render :edit
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
