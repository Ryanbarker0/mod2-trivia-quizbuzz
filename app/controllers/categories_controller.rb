class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_login

  def index
    @categories = Category.all
  end

  def show
    session[:question_ids] = Array.new
    @category.questions.each do |question|
      session[:question_ids] << question.id
    end

    @random_question = session[:question_ids].sample
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
