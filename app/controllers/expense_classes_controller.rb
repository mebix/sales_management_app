class ExpenseClassesController < ApplicationController
  
  def new
    @project = Project.find(params[:project_id])
    @expense_class = @project.expense_classes.build
  end

  def create
    @expense_class = ExpenseClass.new(expense_class_params)
    if @expense_class.save
      @project = Project.find(@expense_class.project_id )
      @expense_classes = @project.expense_classes
      flash[:info] = "Expense Class Created."
      redirect_to project_expense_classes_path(@expense_class.project.id)
    else
      render 'new'
    end
  end
  
  def index
    @project = Project.find(params[:project_id])
    @expense_classes = @project.expense_classes.active
  end
  
  def edit
    @expense_class = ExpenseClass.find(params[:id])
  end

 def update
   @expense_class = ExpenseClass.find(params[:id])
   if @expense_class.update_attributes(expense_class_params)
     flash[:success] = "Update Succeeded"
     redirect_to project_expense_classes_path(@expense_class.project.id)
   else
     render 'edit'
   end
 end

  def destroy
    @expense_class = ExpenseClass.find(params[:id])
    @expense_class.update_attributes(deleted:true , deleted_at:Time.zone.now)
    flash[:success] = "Destroy Succeeded"
    redirect_to project_expense_classes_path(@expense_class.project.id)
  end

  private
    def expense_class_params
      params.require(:expense_class).permit(:project_id, :department_id, :name)
    end
end
