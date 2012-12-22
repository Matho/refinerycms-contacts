
FactoryGirl.define do
  factory :mail, :class => Refinery::Contacts::Mail do
    sequence(:mail) { |n| "refinery#{n}" }
  end
end

