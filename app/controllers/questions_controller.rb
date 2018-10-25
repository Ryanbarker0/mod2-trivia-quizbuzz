class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]
  before_action :set_category, only: [:show]

  def show
    request_api?
    binding.pry

    # work with the cached data
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
  end

  def request_api?
    if !!!$redis.hgetall(@category.name).key?("#{@category.id}")
      api_request($category_api_number)
    end
  end

  def find_question_data
    $redis.hgetall
  end


  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_category
    @category = @question.category
  end
end
