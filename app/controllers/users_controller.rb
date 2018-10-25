class UsersController < ApplicationController
  helper_method :all_total_points

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
    #checks to see if :current_password matches password in db
    #if it does, updates it with the new desired password
    if @user.try(:authenticate, params[:user][:current_password])
      @user.update(user_update_params)
      flash.now[:success] = "Your changes have been saved"
      render :show
    else
      flash[:error] = "Current Password Is Incorrect"
      render :edit
    end
  end

  def destroy
  end

  def all_total_points
    Game.select{|game| game.user_id == session[:user_id]}.map{|game_by_user| game_by_user.score}.sum
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
