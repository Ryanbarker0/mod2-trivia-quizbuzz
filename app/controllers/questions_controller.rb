class QuestionsController < ApplicationController

  def show
    
    @category = @question.category
  end

end
