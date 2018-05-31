class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :project, foreign_key: true
      t.string :class_name
      t.string :name
      t.date :billing_at

      t.timestamps
    end
  end
end
