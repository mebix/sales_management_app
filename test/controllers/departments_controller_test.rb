require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @department = departments(:department1)
  end
  
  test 'invalid create new department' do
    get new_department_path
    assert_no_difference 'Department.count' do
      post departments_path , params:{department:{name: ""}}
    end
     assert_template 'departments/new'
     assert_select "div.alert" , "The form contains 1 error"
  end
  
  test 'create new department' do
    get new_department_path
    assert_difference 'Department.count', 1  do
      post departments_path , params:{department:{name: "Test"}}
    end
    assert_redirected_to departments_path
  end
  
  test 'invalid edit department' do
    get edit_department_path( @department)
    assert_no_difference 'Department.count' do
      patch department_path , params:{department:{name: ""}}
    end
     assert_template 'departments/edit'
     assert_select "div.alert" , "The form contains 1 error"
  end
  
  test 'edit department' do
    get edit_department_path( @department)
    assert_no_difference 'Department.count' do
      patch department_path , params:{department:{name: "Test"}}
    end
    assert_redirected_to departments_path
  end
  
  test "delete department" do
    get departments_path
    Department.active.each do |department|
      assert_select "a[href=?]", edit_department_path(department) ,text: department.name
      assert_select "a[href=?]", department_path(department) ,text: 'delete'
    end

    assert_difference 'Department.active.count' , -1 do
      delete department_path(@department)
    end
    assert_redirected_to departments_path
  end
end
