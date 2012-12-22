module Refinery
  module Contacts
    class TableLessModel
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming
      extend ActiveModel::Translation



      def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value)
        end
      end

      def persisted?
        false
      end

    end
  end
end
