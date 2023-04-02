# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  layout 'devise', only: :new
end
