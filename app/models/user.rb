class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_one :cart
  # has_secure_password
  after_create :create_cart
  private
    def create_cart
     cart = Cart.new(user: self)
     cart.save
    end
end
