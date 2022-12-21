# frozen_string_literal: true

class Company < ApplicationRecord
  after_create :add_admin_user

  belongs_to :owner, class_name: 'User', required: true

  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name,                 presence: true, length: { maximum: 255 }
  validates :legal_name,           length: { maximum: 255 }
  validates :contact_phone_number, length: { maximum: 20 }

  scope :order_by_id_asc,  -> { order(id: :asc) }
  scope :order_by_id_desc,  -> { order(id: :desc) }

  private

  def add_admin_user
    # Create user_role
    role = user_roles.new
    role.user = owner
    role.make_admin!
    role.save!
  end
end
