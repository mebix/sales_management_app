class ExpenseMaster < ApplicationRecord
  has_many :contract_expenses
  validates :name , presence: true , length: {maximum: 50 }
  belongs_to :expense_class
  
   # 未削除expenseスコープ
  scope :active ,-> {where(deleted:false)}
  
  def full_name
    return self.expense_class.department.name + " / " + self.expense_class.name + " / " + self.name
  end
end