class Address < ApplicationRecord
  validates :name, presence: true,length: { in: 3..20 }
  validates :contact_number, presence: true, length: { is: 10 }, numericality: { only_integer: true , greater_than: 0}
  validates :address, presence: true
  validates :landmark, presence: true

  belongs_to :user
  has_many :order
end
