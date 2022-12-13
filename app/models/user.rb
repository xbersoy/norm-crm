# frozen_string_literal: true

require 'devise/models/custom_validatable'

class User < ApplicationRecord
  # include Devise::Models::CustomValidatable

  devise :two_factor_authenticatable, :two_factor_backupable,
         otp_backup_code_length: 10, otp_number_of_backup_codes: 10,
         otp_secret_encryption_key: ENV.fetch('OTP_SECRET_KEY', nil)

  devise :registerable, :recoverable, :rememberable,
         :validatable, :trackable
  #      :confirmable, :lockable, :timeoutable and :omniauthable

  serialize :otp_backup_codes, JSON

  attr_accessor :otp_plain_backup_codes, :company_name, :company_occupation_field, :gdpr, :terms

  has_many :user_roles
  has_many :companies, through: :user_roles

  validates :gdpr,  acceptance: true, on: :create
  validates :terms, acceptance: true, on: :create

  def generate_two_factor_secret_if_missing!
    return unless otp_secret.nil?

    update!(otp_secret: User.generate_otp_secret)
  end

  def enable_two_factor!
    update!(otp_required_for_login: true)
  end

  def disable_two_factor!
    update!(
      otp_required_for_login: false,
      otp_secret: nil,
      otp_backup_codes: nil
    )
  end

  def two_factor_qr_code_uri
    issuer = ENV.fetch('OTP_2FA_ISSUER_NAME', nil)
    label = [issuer, email].join(':')

    otp_provisioning_uri(label, issuer: issuer)
  end

  def two_factor_backup_codes_generated?
    otp_backup_codes.present?
  end
end
