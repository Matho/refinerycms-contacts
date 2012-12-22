class CreateContactsContacts < ActiveRecord::Migration

  def up
    create_table :refinery_contacts do |t|
      t.string :title
      t.string :company
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :province
      t.string :country
      t.string :tel1
      t.string :tel2
      t.string :tel3
      t.string :fax
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contacts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contacts/contacts"})
    end

    drop_table :refinery_contacts

  end

end
