class ExpensesController < ApplicationController

  def new
    @expense = Project.find(params[:project_id]).expenses.new
  end

  def create
    @expense = Project.find(params[:project_id]).expenses.new(expense_params)
    if @expense.save
      @projects = Project.all
      flash[:info] = "Expense Created."
      redirect_to project_path(@expense.project.id)
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

 def update
   @expense = Expense.find(params[:id])
   if @expense.update_attributes(expense_params)
     flash[:success] = "Update Succeeded"
     redirect_to project_path(@expense.project.id)
   else

   end
 end

 def destroy
   @expense = Expense.find(params[:id])
   @expense.update_attributes(deleted:true , deleted_at:Time.zone.now)
   flash[:success] = "Destroy Succeeded"
   redirect_to project_path(@expense.project.id)
 end
 
 def bill_index
   @project = Project.find(params[:project_id])
   @expenses = @project.expenses.where(expense_type: 0).active
 end

 def record_index
   @project = Project.find(params[:project_id])
   @expenses = @project.expenses.where(expense_type: 1).active
 end
  private
    def expense_params
      params.require(:expense).permit(:project_id,
          :billing_at,
          :unit_price,
          :unit,
          :type,
          :contract_expense_id)
    end
end
