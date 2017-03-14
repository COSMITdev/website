class QuizzesController < ApplicationController
  def index;end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(permitted_params)
    action = @quiz.valid? ? :result : :create
    render action
  end

  private

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
      '30k+'
    end
  end

  def permitted_params
    params.require(:quiz).permit(:q1, :q2, :q3, :q4, :q5, :q6, :name, :email)
  end
end
