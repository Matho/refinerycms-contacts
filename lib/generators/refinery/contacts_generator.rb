module Refinery
  class ContactsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_recaptcha_template
      template 'config/initializers/recaptcha.rb.erb', File.join(destination_root, 'config', 'initializers', 'recaptcha.rb')
    end

    def generate_contacts_template
      template 'config/initializers/refinery/contacts.rb.erb', File.join(destination_root, 'config', 'initializers', 'refinery', 'contacts.rb')
    end

    def rake_db
      rake("refinery_contacts:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Contacts extension
Refinery::Contacts::Engine.load_seed
        EOH
      end
    end
  end
end
