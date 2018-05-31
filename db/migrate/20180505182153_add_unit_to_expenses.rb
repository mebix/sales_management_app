class AddUnitToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :unit, :float
    add_column :expenses, :unit_price, :float
  end
end
