module Refinery
  class ContactPage < Refinery::Core::BaseModel

    belongs_to :contact, :class_name => Refinery::Contacts::Contact
    belongs_to :page, :polymorphic => true


    attr_accessible :page_id, :page_type, :contact_id , :contact_info

  end
end
