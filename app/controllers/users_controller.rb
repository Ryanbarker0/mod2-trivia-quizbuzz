class UsersController < ApplicationController
  helper_method :all_total_points, :highest_streak

  before_action :set_user, only: [:show, :edit, :update, :destroy, :all_total_points]


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
    #finding all games by user, sorting all game scores by user into array and summing this array
    Game.select{|game| game.user_id == @user.id}.select{|game| !!game.score}.map{|game| game.score}.sum
  end

  def highest_streak
    Game.select{|game| game.user_id == @user.id}.select{|game| !!game.streak}.max_by{|game| game.streak}.streak
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
