class AddDeletedToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :deleted, :boolean
    add_column :expenses, :deleted_at, :date
  end
end
