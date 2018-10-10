class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question was saved"
      redirect_to @question
    else
      flash[:notice] = "Not saved"
      render action: 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def update
    # raise params.inspect
    @question = Question.find(params[:id])
    binding.pry
    @question.update(title: params[:question][:title], description: params[:question][:description])
    binding.pry
    redirect_to question_path(@question)
  end

  private

  def edit_params
    params.require(:question).permit(:title, :description)
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
