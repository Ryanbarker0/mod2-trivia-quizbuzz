class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]
  before_action :set_category, only: [:category_question, :show]




  def show
    byebug
    @@category_questions.delete(category_question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_category
    @category = @question.category
  end
end
