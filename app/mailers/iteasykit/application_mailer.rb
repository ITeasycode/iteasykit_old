module Iteasykit
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'mailer'

    def test_welcome_email(email, subject, entity)
      @entity = entity
      mail(:to => email, :subject => subject+" - KBE")
    end
  end
end
