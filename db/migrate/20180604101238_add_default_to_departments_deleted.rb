class AddDefaultToDepartmentsDeleted < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:departments, :deleted, false)
  end
end
