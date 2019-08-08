class TableCardDetail < ApplicationRecord

    has_many :payment, :dependent => :nullify
    belongs_to :user
end
