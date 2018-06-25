class ContractExpense < ApplicationRecord
  belongs_to :expense_master
  belongs_to :project
  has_many :expenses
  validates :unit , presence: true
  validates :unit_price , presence: true
  validates :date , presence: true
  validates :deleted , inclusion: {in: [true, false]}
  
  enum status: { not_yet: 0, done: 1 }
  
  def full_name
   return self.date.year.to_s + "年" + self.date.mon.to_s + "月 " + self.expense_master.full_name
  end
  
  # タイプを指定して、費目を作成する
  def copy_to_expense(expense_type = 0)
    e = self.expenses.build
    e.billing_at = self.date
    e.unit = self.unit
    e.unit_price = self.unit_price
    e.project_id = self.project_id
    e.expense_type = expense_type
    e.save!
  end
  
   # 未削除expenseスコープ
  scope :active ,-> {where(deleted:false)}
end
