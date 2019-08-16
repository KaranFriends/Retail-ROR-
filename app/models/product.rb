class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true , greater_than: 0}
  validates :user_id, presence: true
  validates :brand, presence: true
  validates :date_first_available, presence: true
  validate :date_first_available_cannot_be_in_the_future

  def date_first_available_cannot_be_in_the_future
    if date_first_available.present? && date_first_available > Date.today
      errors.add(:date_first_available, "can't be in the future")
    end
  end

  belongs_to :user, optional: true
  has_many :cart_item
  has_one_attached :product_picture
end
