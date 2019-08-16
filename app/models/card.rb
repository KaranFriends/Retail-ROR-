class Card < ApplicationRecord
  validates :card_holder_name, presence: true
  validates :cvv, presence: true, length: { is: 3 }
  validates :expiry, presence: true
  validates :card_number, presence: true, length: { is: 12 }, numericality: { only_integer: true , greater_than: 0}


  validate :expiry_cannot_be_in_the_past

  def expiry_cannot_be_in_the_past
    if expiry.present? && expiry < Date.today
      errors.add(:expiry, "Your card has expired")
    end
  end

  has_many :payment, :dependent => :nullify
  belongs_to :user, optional: true

end
