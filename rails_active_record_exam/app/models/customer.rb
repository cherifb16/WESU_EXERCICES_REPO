class Customer < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :orders, dependent: :destroy

  def foods_price_sum
    self.class.joins(orders: :foods).where(name: self.name).sum(:price)
  end
end
