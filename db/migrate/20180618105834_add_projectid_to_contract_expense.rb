class AddProjectidToContractExpense < ActiveRecord::Migration[5.2]
  def change
    add_reference :contract_expenses, :project, foreign_key: true
  end
end
