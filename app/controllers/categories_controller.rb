class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_login
  helper_method :category_leaderboard

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
  end

  def category_leaderboard
    #selects all the instances of the Game class that have the same category id as the category you are currently viewing/in
    #then sorts this array of game objects by their score in desceding order and takes only the first 10
    Game.select{|game| game.category_id == @category.id}.sort_by{|game| game.score}.reverse.take(10)
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
end
