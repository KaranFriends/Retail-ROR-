class User < ApplicationRecord
  validates :user_name, uniqueness: true, presence: true,length: { in: 3..20 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true,length: { minimum: 2 }
  validates :phone_number, presence: true,length: { is: 10 }, numericality: { only_integer: true , greater_than: 0}
  validates :alternate_number, presence: true,length: { is: 10 }, numericality: { only_integer: true , greater_than: 0}


  def self.authenticate(params)
    if @user = User.where(user_name: params[:user_name]).first
      if @user.password == params[:password]
        @user
      end
    end
  end

  has_one :cart, :dependent => :destroy
  has_many :order, :dependent => :destroy
  has_many :product, :dependent => :destroy
  has_many :address, :dependent => :destroy
  has_many :feedback, :dependent => :destroy
  has_many :card, :dependent => :destroy
  has_one_attached :picture

end
