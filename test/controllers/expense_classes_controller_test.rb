require 'test_helper'

class ExpenseClassesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @project = projects(:project1)
    @department = departments(:department1)
    @expense_class = @project.expense_classes.create(name: "Test", department_id: @department.id)
  end
  
  test "invalid expense_class create1" do
    get new_project_expense_class_path(@project)
    assert_no_difference 'ExpenseClass.count' do
      post expense_classes_path , params:{expense_class:{name: "Test", project_id: @project.id}}
    end
    assert_template 'expense_classes/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid expense_class create2" do
    get new_project_expense_class_path(@project)
    assert_no_difference 'ExpenseClass.count' do
      post expense_classes_path , params:{expense_class:{name: "Test", department_id: @department.id}}
    end
    assert_template 'expense_classes/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid expense_class create3" do
    get new_project_expense_class_path(@project)
    assert_no_difference 'ExpenseClass.count' do
      post expense_classes_path , params:{expense_class:{department_id: @department.id, project_id: @project.id}}
    end
    assert_template 'expense_classes/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "valid expense_class create" do
    get new_project_expense_class_path(@project)
    assert_difference 'ExpenseClass.count', 1  do
      post expense_classes_path , params:{expense_class:{name: "Test", department_id: @department.id, project_id: @project.id}}
    end
    assert_redirected_to project_expense_classes_path(@project)
  end
  
  test "invalid expense_class edit1" do
    get edit_expense_class_path(@expense_class)
    patch expense_class_path(@expense_class), params: { expense_class: { name: @expense_class.name, department_id: nil } }
    assert_template 'expense_classes/edit'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid expense_class edit2" do
    get edit_expense_class_path(@expense_class)
    patch expense_class_path(@expense_class), params: { expense_class: { name: "", department_id: @expense_class.department_id } }
    assert_template 'expense_classes/edit'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "valid expense_class edit" do
    get edit_expense_class_path(@expense_class)
    patch expense_class_path(@expense_class), params: { expense_class: { name: "AAA", department_id: @expense_class.department_id } }
    assert_redirected_to project_expense_classes_path(@expense_class.project_id)
  end
  
  test "delete expense_class" do
    get project_expense_classes_path(@project)
    @project.expense_classes.each do |expense_class|
      assert_select "a[href=?]", expense_class_path(expense_class) ,text: 'delete'
    end
    assert_difference '@project.expense_classes.active.count', -1 do
      delete expense_class_path(@expense_class)
    end
    assert_redirected_to project_expense_classes_path(@expense_class.project_id)
  end
end
