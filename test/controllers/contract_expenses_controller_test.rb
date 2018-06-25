require 'test_helper'

class ContractExpensesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @project = projects(:project1)
    @department = departments(:department1)
    @expense_class = @project.expense_classes.create(name: "Test", department_id: @department.id)
    @expense_master = @expense_class.expense_masters.create(name: "Test", unit_text: "unit")
    @contract_expense = @expense_master.contract_expenses.create(date: Time.zone.now, project_id: @project.id, unit_price: 1000, unit: 10)
  end
  
  test "invalid contract_expense create1" do
    get new_project_contract_expense_path(@project)
    assert_no_difference 'ContractExpense.count' do
      post project_contract_expenses_path(@project) , params:{contract_expense:{date: Time.zone.now, project_id: @project.id,
        expense_master_id: @expense_master.id, unit_price: 1000, unit: nil}}
    end
    assert_template 'contract_expenses/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid contract_expense create2" do
    get new_project_contract_expense_path(@project)
    assert_no_difference 'ContractExpense.count' do
      post project_contract_expenses_path(@project) , params:{contract_expense:{date: Time.zone.now, project_id: @project.id,
        expense_master_id: @expense_master.id, unit_price: nil, unit: 10}}
    end
    assert_template 'contract_expenses/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "invalid contract_expense create3" do
    get new_project_contract_expense_path(@project)
    assert_no_difference 'ContractExpense.count' do
      post project_contract_expenses_path(@project) , params:{contract_expense:{date: Time.zone.now, project_id: @project.id,
        expense_master_id: nil, unit_price: 1000, unit: 10}}
    end
    assert_template 'contract_expenses/new'
    assert_select "div.alert" , "The form contains 1 error"
  end
  
  test "valid contract_expense create" do
    get new_project_contract_expense_path(@project)
    assert_difference 'ContractExpense.count', 1 do
      post project_contract_expenses_path(@project) , params:{contract_expense:{date: Time.zone.now, project_id: @project.id,
        expense_master_id: @expense_master.id, unit_price: 1000, unit: 10}}
    end
    assert_redirected_to project_contract_expenses_path(@project)
  end
  
  test "Create_expense test" do
    assert_difference '@project.expenses.count', 2 do  
      get project_contract_expenses_create_expense_path(@project.id)
    end
  end
end
