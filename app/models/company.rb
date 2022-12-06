class Company < ApplicationRecord
  belongs_to :owner, class_name: 'User', required: true

  validates :name,                 presence: true, length: { maximum: 255 }
  validates :legal_name,           length: { maximum: 255 }
  validates :contact_phone_number, length: { maximum: 20 }

  scope :order_by_id_asc,  -> { order(id: :asc) }
  scope :order_by_id_desc,  -> { order(id: :desc) }

end
