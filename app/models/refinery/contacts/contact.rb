module Refinery
  module Contacts
    class Contact < Refinery::Core::BaseModel
      has_many :mails
      default_scope order("position DESC")

      accepts_nested_attributes_for :mails, :allow_destroy => true

      self.table_name = 'refinery_contacts'

      attr_accessible :title, :street, :city, :zip_code, :homepage, :company, :province, :country, :tel1, :tel2, :tel3, :fax, :position, :mails_attributes

      acts_as_indexed :fields => [:title, :street, :city, :zip_code, :province, :country, :tel1, :tel2, :tel3, :fax]

      validates :title, :presence => true, :uniqueness => true
      validates_format_of :homepage, :with => URI.regexp(['http','https']), :allow_blank => true
    end
  end
end
