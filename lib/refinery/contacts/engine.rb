module Refinery
  module Contacts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Contacts

      engine_name :refinery_contacts

      def self.register(tab)
        tab.name = tab.name = ::I18n.t(:'refinery.plugins.contacts.tab_name')
        tab.partial = "/refinery/admin/pages/tabs/contacts/contacts"
      end

      initializer "register refinerycms_contacts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contacts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contacts_admin_contacts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/contacts/contact'
          }
          
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        Refinery::Page.send :has_one_contact
      end

      config.before_initialize do
        require 'recaptcha/rails'
      end

      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          register tab
        end
        Refinery.register_extension(Refinery::Contacts)
      end

    end
  end
end
