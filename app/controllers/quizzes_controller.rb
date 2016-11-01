class QuizzesController < ApplicationController
  def index
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(permitted_params)
    if @quiz.valid?
      # send to active campaign list
    else
      render :create
    end
  end

  private

  def permitted_params
    params.require(:quiz).permit(:q1, :q2, :q3, :q4, :q5, :q6, :name, :email)
  end
end
