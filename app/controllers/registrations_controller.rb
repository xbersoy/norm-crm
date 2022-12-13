# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  layout 'devise'
  before_action :configure_devise_params

  def new
    build_resource(sign_up_params.except(:password))
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)

    ApplicationRecord.transaction do |_tx|
      super do
        if resource.persisted?
          service = UserService::RegisterCompany.call(resource)
          if service.failed?
            service.errors.each { |error| resource.errors.add :base, error }
            raise ActiveRecord::Rollback
          else
            @registered_company = service.result
          end

          flash[:registered_user_id]    = resource.id
          flash[:registered_company_id] = @registered_company.id
          redirect_to root_path
        end
      end
    end
  end

  private

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :first_name, :password, :company_occupation_field, :password_confirmation, :company_name)
    end
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
