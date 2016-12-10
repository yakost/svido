class QuestionsController < ApplicationController

  def show
    @question = Question.new
  end

  def create
      @question = Question.new(question_params)
      @feedback = Feedback.new
      @user = User.find(params[:question][:receiver_id])
      respond_to do |format|
      if @question.save
        QuestionMailer.new_question(@question).deliver_now
        format.html { redirect_to current_user, notice: "Your message has been sent successfully." }
        format.js
      else
        format.html {render 'users/show'}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end

  end

  def new
    @question = Question.new
  end

  private

  def question_params
    params.require(:question).permit(:user_name, :email, :sender_id, :receiver_id, :body)
  end

end
