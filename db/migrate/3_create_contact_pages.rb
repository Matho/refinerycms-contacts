class CreateContactPages < ActiveRecord::Migration

  def up
    create_table :refinery_contact_pages do |t|
      t.integer :contact_id
      t.integer :page_id
      t.string  :page_type, :default => "Refinery::Page"
      t.boolean :contact_info, :default=> false
    end

    add_index :refinery_contact_pages, :contact_id
    add_index :refinery_contact_pages, :page_id

  end

  def down
    drop_table :refinery_contact_pages
  end

end
