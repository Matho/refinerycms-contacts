require "spec_helper"

describe "manage contact items", :type => :feature, js: true do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  describe "new/create" do
    it "allows to create contact" do
      visit refinery.new_contacts_admin_contact_path

      fill_in "Title", :with => "Creators"


      find(:xpath, "//a[@class='add_fields'][1]").click
      find(:xpath, "//a[@class='add_fields'][1]").click


      find(:xpath, "(//input[@class='mail_field'])[1]").set("martin.markech@matho.sk")
      find(:xpath, "(//input[@class='mail_field'])[2]").set("martin.markech2@matho.sk")

      #save_and_open_page

      fill_in "Company", :with => "Company s.r.o"
      fill_in "Street", :with => "Street"
      fill_in "City", :with => "Bratislava"
      fill_in "Zip Code", :with => "82103"
      fill_in "Province", :with => "Province"
      fill_in "Country", :with => "Slovakia"
      fill_in "Homepage (starts with http://)", :with => "http://www.matho.sk"
      fill_in "Tel1", :with => "+421900000000"


      click_button "Save"

      expect(page).to have_content("'Creators' was successfully added.")

      expect(Refinery::Contacts::Contact.count).to eq(1)
      expect(Refinery::Contacts::Mail.count).to eq(2)
    end
  end
end