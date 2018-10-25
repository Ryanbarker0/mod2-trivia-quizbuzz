class ApplicationController < ActionController::Base

  helper_method :current_user

  def home
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def api_request(category_number)
    url = "https://opentdb.com/api.php?amount=50&category=#{category_number}&difficulty=easy&type=multiple"

    response_string = RestClient.get(url)
    response = JSON.parse(response_string)
    response["results"].each do |question|
    question_number = Question.create(content: question["question"], category_id: @category.id)
    question["incorrect_answers"].each do |wrong_answer|
      Answer.create(question_id: question_number.id, content: wrong_answer, correct: false)
    end
    Answer.create(question_id: question_number.id, content: question["correct_answer"], correct: true)
  end
    # category_questions_answers = Hash.new
    # @i = 0
    # response["results"].each do |question|
    #   @i += 1
    #   category_questions_answers["#{@i}"] = {category: question["category"], question: question["question"], correct_answer: question["correct_answer"], incorrect_answers: question["incorrect_answers"]}
    # end
    # $redis.hset(@category.name, @category.id, category_questions_answers)
  end
end
