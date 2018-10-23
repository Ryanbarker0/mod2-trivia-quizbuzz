class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]
  before_action :set_category, only: [:category_question, :show]

  def show
    session[:question_ids].delete(@question.id)
    session[:question_number] += 1
    if session[:question_number] > 10
      session.delete([:question_number])
      session.delete([:question_ids])
      Game.create(user_id: session[:user_id], category_id: @category.id, score: session[:score])
      redirect_to '/summary'
    end
  end

  def summary
<<<<<<< HEAD
    # @category = session[:category]
=======

>>>>>>> 53ee9366e9fb6daa6878ab69a5ac614815a383e3
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_category
    @category = @question.category
  end
end
