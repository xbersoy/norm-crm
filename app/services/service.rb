# frozen_string_literal: true

class Service
  class ServiceFailedError < ActiveRecord::Rollback; end

  attr_accessor :status, :errors, :result

  def self.call(*args)
    service_object = new(*args)
    if service_object.valid?
      service_object.result = service_object.call
      service_object.status = :success unless service_object.status == :failed
    end
    service_object
  end

  def initialize(*args)
    self.status = :not_run
    self.errors = {}
  end

  def valid?
    validate if respond_to?(:validate)
    status != :failed
  end

  def succeeded?
    status == :success
  end

  def failed?
    status != :success
  end

  private

  def i18n_key
    self.class.name.underscore.tr('/', '.')
  end

  def fail_with_error(error)
    add_error(error)
    raise ServiceFailedError.new, error.to_s, errors.keys.map(&:to_s)
  end

  def add_error(error_key, description = nil)
    self.status = :failed
    errors[error_key] = description || I18n.t("services.#{i18n_key}.errors.#{error_key}")
  end
end
