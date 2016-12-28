module Refinery
  class ContactPage < Refinery::Core::BaseModel

    belongs_to :contact, :class_name => Refinery::Contacts::Contact
    belongs_to :page, :polymorphic => true


  end
end
