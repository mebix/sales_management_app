class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
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

  private
    def expense_params
      params.require(:expense).permit(:project_id,
          :name,
          :class_name,
          :billing_at,
          :unit_price,
          :unit)
    end
end
