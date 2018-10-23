class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @category = @question.category
  end

end
