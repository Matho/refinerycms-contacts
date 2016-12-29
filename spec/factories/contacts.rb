
FactoryGirl.define do
  factory :contact, :class => Refinery::Contacts::Contact do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

