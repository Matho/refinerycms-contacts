require 'spec_helper'

module Refinery
  module Contacts
    describe Mail do
      describe "validations" do
        subject do
          FactoryGirl.create(:mail,
          :mail => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:mail) { should == "Refinery CMS" }
      end
    end
  end
end
