class AddColoumToExpenseMaster < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_masters, :deleted, :boolean
    add_column :expense_masters, :deleted_at, :date
    change_column_default(:expense_masters, :deleted, false)
  end
end
