class ExpenseMaster < ApplicationRecord
  validates :name , presence: true , length: {maximum: 50 }
  belongs_to :expense_class
  
   # 未削除expenseスコープ
  scope :active ,-> {where(deleted:false)}
end