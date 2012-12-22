class CreateContactsMails < ActiveRecord::Migration

  def up
    create_table :refinery_contacts_mails  do |t|
      t.integer :contact_id
      t.string :mail
    end
    add_index :refinery_contacts_mails, :contact_id

  end

  def down
    remove_index :refinery_contacts_mails , :contact_id
    drop_table :refinery_contacts_mails

  end
end
