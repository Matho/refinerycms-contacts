FactoryGirl.define do
  factory :mail_message, :class => Refinery::Contacts::Mail do
    name "Nazov"
    recipient_id 1
    subject "subject"
    text "text"
    sender_mail "martin.markech@matho.sk"

  end
end

