class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.boolean :deleted
      t.date :deleted_at 
      t.timestamps
    end
  end
end
