require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = Project.new(name:'Test' , project_number:'1')
  end

  test "invalid project 1" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "invalid project 2" do
    @project.project_number = ""
    assert_not @project.valid?
  end

  test "invalid project over maximum 1" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "invalid project over maximum 2" do
    @project.project_number = "1"* 51
    assert_not @project.valid?
  end

end
