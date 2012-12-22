module Refinery
  module Contacts
    class Mail < Refinery::Core::BaseModel
      belongs_to :contact

      attr_accessible :mail, :position

      acts_as_indexed :fields => [:mail]

      validates_format_of :mail, :with => /.+@.+\..+/i , :allow_blank => false
    end
  end
end
