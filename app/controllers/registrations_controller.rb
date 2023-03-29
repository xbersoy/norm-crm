# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  layout 'devise'
  layout 'dashboard', only: [:edit]
  before_action :configure_devise_params

  def new
    build_resource(sign_up_params.except(:password))
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)

    ApplicationRecord.transaction do |_tx|
      binding.break
      super do
        if resource.persisted?
          # binding.break
          service = UserService::RegisterCompany.call(resource)
          if service.failed?
            service.errors.each { |error| resource.errors.add :base, error }
            raise ActiveRecord::Rollback
          else
            @registered_company = service.result
          end

          flash[:registered_user_id]    = resource.id
          flash[:registered_company_id] = @registered_company.id
        end
      end
    end
  end

  private

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :company_occupation_field, :company_name)
    end
  end

  def after_sign_up_path_for(resource)
    dashboard_path(resource)
  end
end
