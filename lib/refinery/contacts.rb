require 'refinerycms-core'

module Refinery
  autoload :ContactsGenerator, 'generators/refinery/contacts_generator'

  module Contacts
    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end

    require 'refinery/contacts/engine'
    require 'refinery/contacts/configuration'
    require 'refinery/contacts/extensions/pages_extension'
  end
end
