class ExpenseMastersController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @expense_classes = @project.expense_classes.active
    @expense_master = ExpenseMaster.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @expense_classes = @project.expense_classes.active
    @expense_master = ExpenseMaster.new(expense_master_params)

    if @expense_master.save
      flash[:info] = 'ExpenseMaster was successfully created.'
      redirect_to project_expense_masters_path(@project)
    else
      render 'new'
    end
  end
  
  # 費目クラスが削除されていた場合でも、費目マスタが削除されていない場合は一覧に表示する
  def index
    @project = Project.find(params[:project_id])
    # @expense_masters =  Project.joins({:expense_classes => :expense_masters}).where("Projects.id = ?" , @project.id)
    @expense_masters = @project.active_expense_masters
    
  end
  
  def edit
    @expense_master = ExpenseMaster.find(params[:id])
    @expense_classes = Project.find(ExpenseClass.find(@expense_master.expense_class_id).project_id).expense_classes.active
  end
  
  def update
    @expense_master = ExpenseMaster.find(params[:id])
    @expense_classes = Project.find(ExpenseClass.find(@expense_master.expense_class_id).project_id).expense_classes.active
    if @expense_master.update_attributes(expense_master_params)
      flash[:success] = "Update Succeeded"
      redirect_to project_expense_masters_path(@expense_master.expense_class.project_id)
    else
     render 'edit'
    end
  end
  
  def destroy
    @expense_master = ExpenseMaster.find(params[:id])
    @expense_master.update_attributes(deleted:true , deleted_at:Time.zone.now)
    flash[:success] = "Destroy Succeeded"
    redirect_to project_expense_masters_path(@expense_master.expense_class.project_id)
  end
  
   private
    def expense_master_params
      params.require(:expense_master).permit(:expense_class_id, :name, :unit_text)
    end
    
    # 費目クラスのリスト<オブジェクト>を渡すと、配下の費目マスタのリスト<オブジェクト>を返す
    def expense_masters(expense_classes)
      expense_masters_list = []
      if expense_classes.length == 0 then return expense_masters_list end
      expense_classes.each do |expense_class|
        list = expense_class.expense_masters
        expense_masters_list.push(list)
      end
      return expense_masters_list.flatten!
    end

end
