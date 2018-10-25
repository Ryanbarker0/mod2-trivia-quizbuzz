class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_login
  before_action :category_number_assignment, :request_api?, only: [:show]
  helper_method :category_leaderboard

  def index
    @categories = Category.all
  end

  def show
    # category_number_assignment
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

  def category_leaderboard
    #selects all the instances of the Game class that have the same category id as the category you are currently viewing/in
    #then sorts this array of game objects by their score in desceding order and takes only the first 10
    Game.select{|game| game.category_id == @category.id}.sort_by{|game| game.score}.reverse.take(10)
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
    case @category.name
    when "Science & Nature"
      @@category_api_number = 17
    when "General Knowledge"
      @@category_api_number = 9
    end
  end

  def request_api?
    # if !!!$redis.hgetall(@category.name).key?("#{@category.id}")
    if !@category.questions.any?
      api_request(@@category_api_number)
    end
  end
end
