class ContractExpensesController < ApplicationController
  def new
    @contract_expense = Project.find(params[:project_id]).contract_expenses.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @contract_expense = @project.contract_expenses.new(contract_expense_params)
    if @contract_expense.save
      flash[:info] = 'Contract Expense was successfully created.'
      redirect_to project_contract_expenses_path(@project)
    else
      render 'new'
    end
  end
  
  def index
    @project = Project.find(params[:project_id])
    @contract_expenses = @project.contract_expenses
  end
  
  def edit
    @contract_expense = ContractExpense.find(params[:id])
  end
  
  def update
    @contract_expense = ContractExpense.find(params[:id])
    if @contract_expense.update_attributes(contract_expense_params)
      flash[:success] = "Update Succeeded"
      redirect_to project_contract_expenses_path(@contract_expense.project.id)
    else
      render 'edit'
    end
  end
  
  def create_expense
    @contract_expenses = Project.find(params[:project_id]).contract_expenses.where(status: 0)
    
    begin
      # 作成済みにステータスを変更して保存
      @contract_expenses.each do |contract_expense|
      contract_expense.copy_to_expense(0)
      contract_expense.copy_to_expense(1)
      contract_expense.update(:status => 1)
      end
      flash[:success] = "Expense Created"
    rescue 
      flash[:danger] = "Error!!"
    end
    
    redirect_to project_contract_expenses_path(Project.find(params[:project_id]))
  end
  
  private
    def contract_expense_params
      params.require(:contract_expense).permit(:expense_master_id, :unit, :unit_price, :project_id, :date)
    end
end
