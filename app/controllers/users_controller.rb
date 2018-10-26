class UsersController < ApplicationController
  helper_method :all_total_points, :highest_streak

  before_action :set_user, only: [:show, :edit, :update, :destroy, :all_total_points, :highest_streak, :set_user_games]
  before_action :set_user_games, only: [:all_total_points, :highest_streak]


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
    @user.delete
    redirect_to root_path
  end

  def all_total_points
    #finding all games by user, sorting all game scores by user into array and summing this array
    if Game.select{|game| game.user_id == @user.id}.select{|game| !!game.score}.any?
      Game.select{|game| game.user_id == @user.id}.select{|game| !!game.score}.map{|game| game.score}.sum
    else
      0
    end
  end

  def highest_streak
    if Game.select{|game| game.user_id == @user.id}.select{|game| !!game.streak}.any?
      Game.select{|game| game.user_id == @user.id}.select{|game| !!game.streak}.max_by{|game| game.streak}.streak
    else
      0
    end
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

  # def set_user_games
  #   @user_games = Game.select{|game| game.user_id == @user.id}
  # end

end
