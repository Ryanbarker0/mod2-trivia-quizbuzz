class ApplicationController < ActionController::Base
  helper_method :current_user

  def home; end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def api_request(category_number, difficulty, amount)
    url = "https://opentdb.com/api.php?amount=#{amount}&category=#{category_number}&difficulty=#{difficulty}&type=multiple"

    response_string = RestClient.get(url)
    response = JSON.parse(response_string)
    response['results'].each do |question|
      sanitize_question = ActionView::Base.full_sanitizer.sanitize(question['question'])
      question_number = Question.create(content: sanitize_question.gsub(/&amp;/, '&'), category_id: @category.id)
      question['incorrect_answers'].each do |wrong_answer|
        sanitize_incorrect_answer = ActionView::Base.full_sanitizer.sanitize(wrong_answer)
        Answer.create(question_id: question_number.id, content: sanitize_incorrect_answer.gsub(/&amp;/, '&'), correct: false)
      end
      sanitize_correct_answer = ActionView::Base.full_sanitizer.sanitize(question['correct_answer'])
      Answer.create(question_id: question_number.id, content: sanitize_correct_answer.gsub(/&amp;/, ' & '), correct: true)
    end
  end
end
