module Refinery
  module Contacts
    module Admin
      class ContactsController < ::Refinery::AdminController
        include ContactsHelper
        helper :"refinery/contacts/admin/contacts"
        cache_sweeper ContactSweeper

        crudify :'refinery/contacts/contact', :xhr_paging => true

      end
    end
  end
end
