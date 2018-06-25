class AddStatusToContractExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :contract_expenses, :status, :integer , default: 0, null: false, limit: 1
    add_index :contract_expenses, :status
  end
end
