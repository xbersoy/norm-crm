# frozen_string_literal: true

class UserRole < ApplicationRecord
  before_destroy :check_company_owner

  belongs_to :user, required: true
  belongs_to :company, required: true

  scope :active, -> { where(active: true) }

  def make_admin!
    self.employees = FULL_ACCESS
    self.accounts = FULL_ACCESS
    self.settings = FULL_ACCESS
    self.user_role_type = 'admin'
  end

  private

  def check_company_owner
    if user_id == company.owner_id
      errors.add(:base, :company_owner_cannot_be_deleted)
      throw :abort
    end
  end
end
