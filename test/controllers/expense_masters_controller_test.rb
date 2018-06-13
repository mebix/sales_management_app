require 'test_helper'

class ExpenseMastersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @department = departments(:department1)
    @project = projects(:project1)
    @expense_class = @project.expense_classes.create(name: "class1" ,department_id: @department.id)
    @expense_master = @expense_class.expense_masters.create(name: "Test", unit_text: "unit")
  end
  
  test "invalid expense_master create1" do
    get new_project_expense_master_path(@project.id)
    assert_no_difference 'ExpenseMaster.count' do
      post project_expense_masters_path(@project) , params:{expense_master:{name: "Test"}}
    end
    assert_template 'new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid expense_master create2" do
    get new_project_expense_master_path(@project.id)
    assert_no_difference 'ExpenseMaster.count' do
      post project_expense_masters_path(@project) , params:{expense_master:{expense_class_id: @expense_class.id }}
    end
    assert_template 'new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "valid expense_master create" do
    get new_project_expense_master_path(@project.id)
    assert_difference 'ExpenseMaster.count', 1 do
      post project_expense_masters_path(@project) , params:{expense_master:{name: "Test", expense_class_id: @expense_class.id }}
    end
    assert_redirected_to project_expense_masters_path(@project)
  end
  
  test "invalid expense_master edit1" do
    get edit_expense_master_path(@expense_master)
    patch expense_master_path(@expense_master), params: {expense_master: {name: nil, expense_class_id: @expense_master.expense_class_id,
                                                          unit_text: @expense_master.unit_text } }
    assert_template 'expense_masters/edit'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid expense_master edit2" do
    get edit_expense_master_path(@expense_master)
    patch expense_master_path(@expense_master), params: {expense_master: {name: @expense_master.name, expense_class_id: nil,
                                                          unit_text: @expense_master.unit_text } }
    assert_template 'expense_masters/edit'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "valid expense_master edit" do
    get edit_expense_master_path(@expense_master)
    patch expense_master_path(@expense_master), params: {expense_master: {name: @expense_master.name, 
                                                                          expense_class_id: @expense_master.expense_class_id,
                                                                          unit_text: @expense_master.unit_text } }
    assert_redirected_to project_expense_masters_path(@project)
  end
  
  test "valid expense_master delete" do
    get project_expense_masters_path(@project)
    @project.active_expense_masters.each do |expense_master|
      assert_select "a[href=?]", expense_master_path(expense_master) ,text: 'delete'
    end
    assert_difference '@project.active_expense_masters.count', -1 do
      delete expense_master_path(@expense_master)
    end
    assert_redirected_to project_expense_masters_path(@project)
  end
end
