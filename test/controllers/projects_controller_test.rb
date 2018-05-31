require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @project = projects(:project1)
  end

  test "invalid create Project 1" do
    get new_project_path
    assert_no_difference 'Project.count' do
      post projects_path , params:{project:{name: "Project" ,
                                            project_number: ""}}
    end
    assert_template 'projects/new'
    assert_select "div.alert" , "The form contains 1 error"
  end

  test "invalid create Project 2" do
    get new_project_path
    assert_no_difference 'Project.count' do
      post projects_path , params:{project:{name: "" ,
                                            project_number: "1"}}
    end
    assert_template 'projects/new'
    assert_select "div.alert" , "The form contains 1 error"
  end

  test "delete" do
    get projects_path
    Project.all.each do |project|
      assert_select "a[href=?]", project_path(project) ,text: project.name
      assert_select "a[href=?]", project_path(project) ,text: 'delete'
    end

    assert_difference 'Project.count' , -1 do
      delete project_path(@project)
    end
    assert_redirected_to projects_path
  end
end
