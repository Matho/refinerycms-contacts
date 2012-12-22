module Refinery
  module Contacts
    module Admin
      class ContactSweeper < ActionController::Caching::Sweeper
=begin
# Because of server-side error rendering, caching is commented.
        observe Contact


        def sweep(contact)
          expire_fragment("refinery/contacts/contact/#{contact.id}")
        end


        alias_method :after_create,  :sweep
        alias_method :after_update,  :sweep
        alias_method :after_destroy, :sweep
=end
      end
    end
  end
end
