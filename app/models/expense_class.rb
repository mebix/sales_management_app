class ExpenseClass < ApplicationRecord
  has_many :expense_masters
  belongs_to :project
  belongs_to :department
  validates :name , presence: true , length: {maximum: 50 }
  
  
  # 未削除expenseスコープ
  scope :active ,-> {where(deleted:false)}
end
