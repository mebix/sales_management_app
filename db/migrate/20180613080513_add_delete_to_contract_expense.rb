class AddDeleteToContractExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :contract_expenses, :deleted, :boolean
    add_column :contract_expenses, :deleted_at, :date
    change_column_default(:contract_expenses, :deleted, false)
  end
end
