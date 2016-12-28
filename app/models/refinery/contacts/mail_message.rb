module Refinery
  module Contacts
    class MailMessage < TableLessModel


      validates :name,         :presence => true
      validates :recipient_id, :presence => true
      validates_numericality_of :recipient_id, :if => Proc.new { |mail_message| mail_message.recipient_id.present? } # dont show recipient is not number, when that mail adress is not selected yet.

      validates :subject,   :presence => true
      validates :text,      :presence => true
      validates_format_of   :sender_mail, :with => /.+@.+\..+/i , :allow_blank => false
    end
  end
end
