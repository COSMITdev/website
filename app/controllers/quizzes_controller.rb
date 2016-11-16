class QuizzesController < ApplicationController
  def index
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(permitted_params)

    if @quiz.valid?
      subscribe_to_active_campaign(@quiz)
      render :result
    else
      render :create
    end
  end

  private

  def subscribe_to_active_campaign(quiz)
    name = quiz.name
    email = quiz.email

    if Rails.env.production?
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1,
        tags: "quiz,sw#{','+define_budget_tag(quiz.q6)}"))
    else
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[1]' => 1, 'status[1]' => 1,
        tags: "quiz,sw#{','+define_budget_tag(quiz.q6)}"))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def define_budget_tag(budget_code)
    case budget_code
    when '19'
      '0k'
    when '18'
      '2k'
    when '15'
      '3-5k'
    when '12'
      '6-15k'
    when '7'
      '16-30k'
    when '3'
      '30+k'
    end
  end

  def permitted_params
    params.require(:quiz).permit(:q1, :q2, :q3, :q4, :q5, :q6, :name, :email)
  end
end
