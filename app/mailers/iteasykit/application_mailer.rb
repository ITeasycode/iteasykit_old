module Iteasykit
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'mailer'
<<<<<<< HEAD

    def test_welcome_email(email, subject, entity)
      @entity = entity
      mail(:to => email, :subject => subject+" - KBE")
    end
=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
  end
end
