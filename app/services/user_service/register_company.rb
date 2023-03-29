# frozen_string_literal: true

module UserService
  class RegisterCompany < Service
    attr_reader :resource, :persisted_user

    def initialize(resource)
      super()

      @resource = resource
      @persisted_user = User.find(resource.id)
    end

    def call
      fail_with_error(:create_company_failed) unless create_company

      return if status == :failed

      @company
    end

    private

    def create_company
      @company = persisted_user.companies.create(
        name:             resource.company_name,
        occupation_field: resource.company_occupation_field
      )

      @company.owner = persisted_user
      @company.save
    end
  end
end
