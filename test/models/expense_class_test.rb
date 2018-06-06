require 'test_helper'

class ExpenseClassTest < ActiveSupport::TestCase
  
  def setup
    @department = departments(:department1)
    @project = projects(:project1)
  end
  
  test "invalid new ExpenseClass 1" do
    @expenseclass = ExpenseClass.new(project_id: @project.id, department_id: @department.id )
    assert_not @expenseclass.valid?
  end
  
  test "invalid new ExpenseClass 2" do
    @expenseclass = ExpenseClass.new(department_id: @department.id, name: "Test" )
    assert_not @expenseclass.valid?
  end
  
  test "invalid new ExpenseClass 3" do
    @expenseclass = ExpenseClass.new(project_id: @project.id, name: "Test" )
    assert_not @expenseclass.valid?
  end
  
  test "valid new ExpenseClass" do
    @expenseclass = ExpenseClass.new(project_id: @project.id, department_id: @department.id, name: "Test")
    assert @expenseclass.valid?
  end
end
