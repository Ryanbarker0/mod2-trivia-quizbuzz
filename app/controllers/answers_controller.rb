class AnswersController < ApplicationController

  before_action :set_answer, only: [:show]

  def show
    @question = Question.find(@answer.question_id)
    @category = Category.find(@question.category_id)
    if @answer.correct
      session[:score] += 100
    end
    redirect_to @category.questions.find(session[:question_ids].sample)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

end
