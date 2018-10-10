class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successffully."
      redirect_to @question
    else
      flash[:notice] = "Failed to save answer"
      # @answers = @question.answers
      # redirect_to "/questions/#{params[:question_id]}"
      render "questions/show"
    end
  end


private

def answer_params
  params.require(:answer).permit(:description)
end

end
