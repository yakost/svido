class QuestionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.question_mailer.new_question.subject
  #
  def new_question(question)
    @question = question

    mail to: "to@example.org",
         subject: "You received a new question"
  end


end
