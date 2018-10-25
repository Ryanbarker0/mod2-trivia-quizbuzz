class AnswersController < ApplicationController

  before_action :set_answer, only: [:show, :streak]
  before_action :set_question, only: [:show, :streak]
  before_action :set_category, only: [:show, :streak]

  def show
    # @question = Question.find(@answer.question_id)
    # @category = Category.find(@question.category_id)
    if @answer.correct
      session[:streak] += 1
      session[:score] += 100
      redirect_to @category.questions.find(session[:question_ids].sample)
    elsif session[:hot_streak] == true
      session[:hot_streak] = 'over'
      redirect_to @category.questions.find(session[:question_ids].sample)
    else
      redirect_to @category.questions.find(session[:question_ids].sample)
    end
  end

  # def streak
  #   @
  #   if !@answer.correct
  #     redirect_to streak_summary_path
  #   elsif @anwser.correct
  #     redirect_to hot_streak_path(@category.questions.find(session[:question_ids].sample))
  #   end
  # end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(@answer.question_id)
  end

  def set_category
    @category = Category.find(@question.category_id)
  end

end
