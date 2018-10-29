class UsersController < ApplicationController
  helper_method :all_total_points, :highest_streak, :friends_leaderboard

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

  def friends
    @user = User.find(session[:users_profile]["id"])
    Friend.create(user_id: session[:user_id], friend_id: @user.id)
    redirect_to user_path(@user)
  end

  def unfriends
    @user = User.find(session[:users_profile]["id"])
    User.find(session[:user_id]).friends.find_by(friend_id: @user.id).delete
    redirect_to user_path(@user)
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
    @user.games.each{|g| g.delete}
    @user.delete
    session.destroy
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

  def friends_leaderboard
    friends_games = User.find(session[:user_id]).friends.map{|friend| User.find(friend.id).games.select{|game| !!game.streak}}
    friends_games.flatten.sort_by{|game| game.streak}.reverse.take(10)
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
