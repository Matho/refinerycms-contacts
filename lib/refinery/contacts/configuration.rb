module Refinery
  module Contacts
    include ActiveSupport::Configurable

    config_accessor :client_side_validations


    self.client_side_validations = false
  end
end
