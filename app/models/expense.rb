class Expense < ApplicationRecord
  require 'bigdecimal'
  belongs_to :project
  validates :name , presence: true , length: {maximum: 50 }
  validates :class_name , presence: true , length: {maximum: 50 }
  validates :billing_at , presence: true
  validates :unit , presence: true
  validates :unit_price , presence: true
  validates :deleted , default: false 

  # 未削除ユーザスコープ
  scope :active ,-> {where(deleted:false)}

  def price
    if !self.unit.nil? && !self.unit_price.nil?
      BigDecimal(self.unit.to_s) * BigDecimal(self.unit_price.to_s)
    else
      return 0
    end
  end
end
