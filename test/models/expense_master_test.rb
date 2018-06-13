require 'test_helper'

class ExpenseMasterTest < ActiveSupport::TestCase
  def setup
    @department = departments(:department1)
    @project = projects(:project1)
    @expense_class = @project.expense_classes.build(name: "class1" ,department_id: @department.id)
    @expense_class.save
  end
  
  test "invalid new ExpenseMaster 1" do
    @expense_master = ExpenseMaster.new(expense_class_id: @expense_class.id )
    assert_not @expense_master.valid?
  end
  
  test "invalid new ExpenseMaster2" do
    @expense_master = ExpenseMaster.new(name: "master1")
    assert_not @expense_master.valid?
  end
  
  test "invalid new ExpenseMaster3" do
    name = "a" * 51
    @expense_master = ExpenseMaster.new(name: name, expense_class_id: @expense_class.id )
    assert_not @expense_master.valid?
  end
  
  test "valid new ExpenseMaster" do
    @expense_master = ExpenseMaster.new(name: "master1", expense_class_id: @expense_class.id )
    assert @expense_master.valid?
  end
end
