class QuestionsController < ApplicationController
  helper_method :score_response, :highest_score_for_user_in_category, :high_score?

  before_action :set_question, only: [:show]
  before_action :set_category, only: [:show]

  def show
    # request_api?
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


  #----------helper_methods--------#

  def high_score? (score)
    if score >= highest_score_for_user_in_category
      "Personal high score - nice!"
    else
      score_response
    end
  end

  def highest_score_for_user_in_category
    User.find(session[:user_id]).games.select{|game| game.category_id == session[:category]["id"]}.max_by{|category_game| category_game.score}.score
  end

  def score_response
    points = session[:score]
    responses = {
      perfect_score: ["Incredible - how do you do it!", "What a braniac!", "Amazing..", "Impressive, but do not forget - the true sign of intelligence is not knowledge but imagination..", "The truly intelligent person is one who can pretend to be a fool..", "You've done this before haven't you.."],
      good_score: ["Good, but not perfect - have another go!", "Nice one!", "Well done!", "Noice."],
      average_score: ["Distinctively average..", "I think we both know you can do better.", "Not good, not bad - just average. A metaphor for your personality, and your looks perhaps?"],
      bad_score: ["Looks like it's time to brush up on your knowledge of this subject!", "Do yourself some justice and have another go.", "Oh dear..", "How did you get this far in life?", "Maybe this quiz stuff just isn't for you.."],
      zero_score: ["As Anne Robinson famously said, 'you are the weakest link - goodbye.'", "'The difference between stupidity and genius is that genius has its limits' - Albert Einstein.", "'I believe alien life is quite common in the universe, although intelligent life is less so. Some say it has yet to appear on planet Earth' - Stephen Hawking.", "'The truly intelligent person is one who can pretend to be a fool..'"]
    }
    case points
    when (1000)
      responses[:perfect_score].shuffle[0]
    when (700..900)
      responses[:good_score].shuffle[0]
    when (400..600)
      responses[:average_score].shuffle[0]
    when (100..300)
      responses[:bad_score].shuffle[0]
    when (0)
      responses[:zero_score].shuffle[0]
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
