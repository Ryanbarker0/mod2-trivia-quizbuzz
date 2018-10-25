class AnswersController < ApplicationController

  before_action :set_category, only: [:incorrect, :correct]

  def incorrect
    if session[:hot_streak] == true
      session[:hot_streak] = 'over'
    end
      redirect_to @category.questions.find(session[:question_ids].sample)
  end

  def correct
    session[:score] += 100
    session[:streak] += 1
    redirect_to @category.questions.find(session[:question_ids].sample)
  end

  private

  def set_category
    @category = Category.find_by(name: session[:category]["name"])
  end

end
