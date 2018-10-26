class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_login
  before_action :category_number_assignment, :request_api?, only: [:show]
  helper_method :category_score_leaderboard, :category_streak_leaderboard, :top_5_streaks_of_the_day

  def index
    @categories = Category.all
  end

  def show

    session[:category] = @category
    session[:question_number] = 0
    session[:question_ids] = Array.new
    @category.questions.each do |question|
      session[:question_ids] << question.id
    end

    @random_question = session[:question_ids].sample
    session[:score] = 0
    session[:streak] = 0
    session[:hot_streak] = false
  end


  #---------leaderboard helper methods----–––––––#

  def category_score_leaderboard
    #selects all the instances of the Game class that have the same category id as the category you are currently viewing/in
    #then sorts this array of game objects by their score in desceding order and takes only the first 10
    Game.select{|game| game.category_id == @category.id && !!game.score}.sort_by{|game| game.score}.reverse.take(10)
  end

  def category_streak_leaderboard
    #same as above but for streaks
    Game.select{|game| game.category_id == @category.id && !!game.streak}.sort_by{|game| game.streak}.reverse.take(10)
  end

  def top_5_streaks_of_the_day
    Game.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).select{|game| !!game.streak }.sort_by{|game| game.streak}.reverse.take(5)
  end


  def feed
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def require_login
    unless session.include? :user_id
      # head(:forbidden)
      redirect_to '/'
    end
  end

  def category_number_assignment
    @@difficulty = "easy"
    @@amount = 25
    case @category.name
    when "Science & Nature"
      @@category_api_number = 17
      @@difficulty = "medium"
    when "General Knowledge"
      @@category_api_number = 9
    when "Computers"
      @@category_api_number = 18
    when "Music"
      @@category_api_number = 12
    when "Movies"
      @@category_api_number = 11
    when "Video Games"
      @@category_api_number = 15
    when "History"
      @@category_api_number = 23
    when "Anime"
      @@category_api_number = 31
    when "Animals"
      @@category_api_number = 27
      @@amount = 11
      @@difficulty = "medium"
    when "Geography"
      @@category_api_number = 22
    when "Politics"
      @@category_api_number = 24
      @@amount = 15
      @@difficulty = "medium"
    when "Books"
      @@category_api_number = 10
      @@difficulty = "medium"
    when "Sports"
      @@category_api_number = 21
      @@amount = 20
    when "Vehicles"
      @@category_api_number = 28
      @@amount = 20
      @@difficulty = "medium"
    when "Celebrities"
      @@category_api_number = 26
      @@amount = 20
      @@difficulty = "medium"
    end
  end

  def request_api?
    if !@category.questions.any?
      api_request(@@category_api_number, @@difficulty, @@amount)
    end
  end
end
