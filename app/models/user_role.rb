# frozen_string_literal: true

class UserRole < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :company, required: true

  after_create :add_admin_user

  def add_admin_user
    # Create user_role
    role = user_roles.new
    role.user = owner
    role.save!
  end
end
