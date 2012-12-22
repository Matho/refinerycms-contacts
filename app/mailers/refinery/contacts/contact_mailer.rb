module Refinery
  module Contacts
    class ContactMailer < ActionMailer::Base

      def contact_form(mail_message)
        @mail_message= mail_message

        mail :from => @mail_message.sender_mail ,
             :to   => @mail_message.recipient_mail ,
             :subject => @mail_message.subject

      end
    end
  end
end