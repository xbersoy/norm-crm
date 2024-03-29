# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include AuthenticateWithOtpTwoFactor
  layout 'devise'

  prepend_before_action :authenticate_with_otp_two_factor,
                        if: -> { action_name == 'create' && otp_two_factor_enabled? }

  protect_from_forgery with: :exception, prepend: true, except: :destroy

  def after_sign_in_path_for(resource)
    dashboard_path(current_user)
  end
end
