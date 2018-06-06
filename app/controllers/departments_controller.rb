class DepartmentsController < ApplicationController
  
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)
    if @department.save
      @departments = Department.all
      flash[:info] = "Department Created."
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def index
    @departments = Department.active
  end
  
  def edit
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])

    if @department.update_attributes(department_params)
      flash[:success] = "Update Succeeded"
      redirect_to departments_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.update_attributes(deleted:true , deleted_at:Time.zone.now)
    flash[:success] = "Destroy Succeeded"
    redirect_to departments_path
  end
  
  private
    def department_params
      params.require(:department).permit(:name)
    end
end
