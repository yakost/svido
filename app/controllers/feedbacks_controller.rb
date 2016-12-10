class FeedbacksController < ApplicationController

  def create
      @feedback = Feedback.new(feedback_params)
      respond_to do |format|
        if @feedback.save
          format.html {   redirect_to user_path(@feedback.receiver), notice: ' Feedback was successfully created.' }
        else
          format.html { redirect_to user_path(@user), notice: ' something wrong.' }
        end
      end
  end

  def new
    @feedback = Feedback.new
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_name, :receiver_id, :sender_id, :body)
  end

end
