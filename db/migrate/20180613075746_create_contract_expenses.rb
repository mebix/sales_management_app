class CreateContractExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_expenses do |t|
      t.date :date
      t.integer :unit_price
      t.integer :unit
      t.references :expense_master, foreign_key: true
      t.timestamps
    end
  end
end
