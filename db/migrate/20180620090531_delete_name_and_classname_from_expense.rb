class DeleteNameAndClassnameFromExpense < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :name, :string
    remove_column :expenses, :class_name, :string
    add_column :expenses, :expense_type, :integer , default: 0, null: false, limit: 1
    add_reference :expenses, :contract_expense, foreign_key: true
  end
end
