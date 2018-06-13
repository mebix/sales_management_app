class CreateExpenseMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_masters do |t|
      t.string :name
      t.references :expense_class, foreign_key: true
      t.string :unit_text

      t.timestamps
    end
  end
end
