module Refinery
  module Contacts
    class MailMessagesController < ::ApplicationController

      def deliver
        @mail_message = MailMessage.new(params[:mail_message])


        if @mail_message.valid? && verify_recaptcha(:model => @mail_message)
          mail = Refinery::Contacts::Mail.select("mail").find(@mail_message.recipient_id)
          @mail_message.recipient_mail = mail[:mail].to_s

          ContactMailer.contact_form(@mail_message).deliver


          flash[:notice] = t('refinery.contacts.contacts.flash.successfull_delivery')
        else
          flash[:mail_message] = @mail_message # send back to form data from filled fields. this is not very good way, but better than monkey-patch Page's controller, I think
        end

        redirect_to :back
      end

    end
  end
end
