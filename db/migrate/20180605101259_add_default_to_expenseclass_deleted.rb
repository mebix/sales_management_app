class AddDefaultToExpenseclassDeleted < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:expense_classes, :deleted, false)
  end
end
