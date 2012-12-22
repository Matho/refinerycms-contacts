# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Contacts" do
    describe "Admin" do
      describe "mails" do
        login_refinery_user

        describe "mails list" do
          before do
            FactoryGirl.create(:mail, :mail => "UniqueTitleOne")
            FactoryGirl.create(:mail, :mail => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.contacts_admin_mails_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.contacts_admin_mails_path

            click_link "Add New Mail"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Mail", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Contacts::Mail.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Mail can't be blank")
              Refinery::Contacts::Mail.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:mail, :mail => "UniqueTitle") }

            it "should fail" do
              visit refinery.contacts_admin_mails_path

              click_link "Add New Mail"

              fill_in "Mail", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Contacts::Mail.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:mail, :mail => "A mail") }

          it "should succeed" do
            visit refinery.contacts_admin_mails_path

            within ".actions" do
              click_link "Edit this mail"
            end

            fill_in "Mail", :with => "A different mail"
            click_button "Save"

            page.should have_content("'A different mail' was successfully updated.")
            page.should have_no_content("A mail")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:mail, :mail => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contacts_admin_mails_path

            click_link "Remove this mail forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Contacts::Mail.count.should == 0
          end
        end

      end
    end
  end
end
