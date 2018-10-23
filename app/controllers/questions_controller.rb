class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]
  before_action :set_category, only: [:category_question, :show]

  def show
    session[:question_ids].delete(@question.id)
    session[:score] = 0
    session[:question_number] += 1
    if session[:question_number] > 10
      session[:question_number] = nil
      session[:question_ids].clear
      Game.create(user_id: session[:user_id], category_id: @category.id, score: session[:score])
      redirect_to categories_url
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_category
    @category = @question.category
  end
end
