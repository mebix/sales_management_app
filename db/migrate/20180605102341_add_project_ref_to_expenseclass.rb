class AddProjectRefToExpenseclass < ActiveRecord::Migration[5.2]
  def change
    add_reference :expense_classes, :project, foreign_key: true
    add_reference :expense_classes, :department, foreign_key: true
  end
end
