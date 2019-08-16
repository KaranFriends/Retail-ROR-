class Address < ApplicationRecord
  validates :name, presence: true,length: { in: 3..20 }
  validates :contact_number, presence: true, length: { is: 10 }, numericality: { only_integer: true , greater_than: 0}
  validates :address, presence: true
  validates :landmark, presence: true


  validate :address_associated

  def address_associated
    if Order.find_by(address_id: self.id)
      false
    else
      true
    end
  end

  belongs_to :user
  has_many :order, :dependent => :nullify
end
