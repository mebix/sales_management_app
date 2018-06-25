class AddDefaultToExpenseDeleted < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:expenses, :deleted, false)
  end
end
