class ApplicationController < ActionController::Base

  helper_method :current_user

  def home
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def api_request(category_number)
    url = "https://opentdb.com/api.php?amount=20&category=#{category_number}&difficulty=medium&type=multiple"

    response_string = RestClient.get(url)
    response = JSON.parse(response_string)
    category_questions_answers = []
    response["results"].each do |question|
      category_questions_answers << {category: question["category"], question: question["question"], correct_answer: question["correct_answer"], incorrect_answers: question["incorrect_answers"]}
    end
    $redis.set("#{@category.id}", category_questions_answers)

  end
end
