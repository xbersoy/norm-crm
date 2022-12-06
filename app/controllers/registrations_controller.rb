# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  layout proc{ |controller| user_signed_in? ? 'application' : 'devise' }
end
