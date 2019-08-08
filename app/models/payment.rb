class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :table_card_detail, optional: true
end
