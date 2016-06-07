module Devise
  module Activatable

    mattr_accessor :allow_inactivated_access_for
    @@allow_inactivated_access_for = 0.days

    mattr_accessor :activate_within
    @@activate_within = 2.days

    mattr_accessor :activation_keys
    @@confirmation_keys = [:phone]

    mattr_accessor :reactivatable
    @@reconfirmable = true

    def self.setup
      yield self
    end
  end
end

# Register TokenAuthenticatable module in Devise.
Devise::add_module :activatable,
                   model: 'devise/activatable/model',
                   strategy: false,
                   no_input: true
