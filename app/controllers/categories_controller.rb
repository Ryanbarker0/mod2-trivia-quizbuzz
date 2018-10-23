class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_login

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
