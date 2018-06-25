class AddExpenseCreated < ActiveRecord::Migration[5.2]
  def change
    add_column :contract_expenses, :expense_created, :boolean
    change_column_default(:contract_expenses, :expense_created, false)
  end
end
