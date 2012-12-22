module Refinery
  module Contacts
    module Extensions
      module Pages
        def has_one_contact
          has_one :contact_page, :as => :page, :dependent=> :destroy
          has_one :contact, :through => :contact_page
          has_many :mails, :class_name => Refinery::Contacts::Mail, :through => :contact


          accepts_nested_attributes_for :contact_page

          module_eval do
            def contact_page=(contact_page_params)
              # new
              if self.contact_page.nil?
                self.build_contact_page
              end

              # destroy
              if contact_page_params[:contact_id].blank?
                self.contact_page.destroy

              # create or update if changed
              elsif (self.contact_page.contact_id.to_s != contact_page_params[:contact_id]) || (self.contact_page.contact_info != contact_page_params[:contact_info] )
                self.contact_page.update_attributes( contact_page_params)
                self.contact_page.save
              end

            end
          end

          attr_accessible :contact_page
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::Contacts::Extensions::Pages)