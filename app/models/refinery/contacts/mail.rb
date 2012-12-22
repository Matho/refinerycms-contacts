module Refinery
  module Contacts
    class Mail < Refinery::Core::BaseModel
      belongs_to :contact

      attr_accessible :mail, :position

      acts_as_indexed :fields => [:mail]

      validates_format_of :mail, :with => /.+@.+\..+/i , :allow_blank => false

      def self.obfuscated
        self.all.each do |m|
          m.mail = self.to_decimal_entities(m.mail).html_safe
        end
      end

      private
      def self.to_decimal_entities(string)
         string.each_char.collect {|char| "&##{char.unpack('U')[0]};" }.join
      end

    end
  end
end
