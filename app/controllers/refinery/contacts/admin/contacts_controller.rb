module Refinery
  module Contacts
    module Admin
      class ContactsController < ::Refinery::AdminController
        include ContactsHelper
        helper :"refinery/contacts/admin/contacts"

        crudify :'refinery/contacts/contact', :xhr_paging => true

        protected

        def contact_params
          params.require(:contact).permit(:title, :street, :city, :zip_code, :homepage, :company, :province, :country, :tel1, :tel2, :tel3, :fax, :position, :mails_attributes => [:id, :mail, :_destroy ])
        end
      end
    end
  end
end
