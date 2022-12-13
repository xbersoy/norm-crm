module UserService
  class RegisterCompany < Service
    attr_reader :user

    def initialize(user)
      super()

      @user = User.find(user.id)
    end

    def call
      fail_with_error(:create_company_failed) unless create_company

      return if status == :failed

      @company
    end

    private

    def create_company
      @company = user.companies.create(
        name:             user.company_name,
        occupation_field: user.company_occupation_field
      )

      @company.owner = user
      @company.save
    end
  end
end
