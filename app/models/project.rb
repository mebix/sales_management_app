class Project < ApplicationRecord
  validates :name , presence: true , length: {maximum: 50 }
  validates :project_number , presence: true , length: {maximum: 50 },
            uniqueness:{case_sensitive:false}
  has_many :expenses
  has_many :expense_classes
  has_many :contract_expenses
  
  # プロジェクト配下にある費目マスターをすべて取ってくる
  def expense_masters
    expense_masters_list = []
    expense_classes = self.expense_classes
    if expense_classes.length == 0 then return expense_masters_list end
    
    expense_classes.each do |expense_class|
      list = expense_class.expense_masters
      expense_masters_list.push(list)
    end
    return expense_masters_list.flatten!
  end
  
  # プロジェクト配下にある削除されていない費目マスターをすべて取ってくる
  def active_expense_masters
    expense_classes = self.expense_classes
    expense_masters_list = []
    if expense_classes.length == 0 then return expense_masters_list end
    
    expense_classes.each do |expense_class|
      list = expense_class.expense_masters.active
      expense_masters_list.push(list)
    end
    return expense_masters_list.flatten!
  end
end
