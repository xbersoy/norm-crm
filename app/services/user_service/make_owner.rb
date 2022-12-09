class UserService::MakeOwner < Service
  attribute :company, Company
  attribute :user, User

  # Actually it is required, but it may be received as empty when user sends empty password.
  # Since we already check the password in validate block, we don't need to make it required.
  attribute :password, String, required: false

  def validate
    add_error(:password_invalid) unless company.owner.valid_password?(password)
  end

  def call
    user_role = user.active_user_roles.find_by_company_id!(company.id)

    GlobalDbRecord.transaction do
      user_role.make_admin!
      user_role.save!
      company.update!(owner: user)
    end
  end
end
