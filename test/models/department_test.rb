require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  
  def setup
    @department = Department.new
  end
  
  test 'invalid department 1' do
    @department.name = 'a' * 51
    @department.deleted = false
    assert_not  @department.valid?
  end
  
   test 'valid department 1' do
    @department.name = 'IT_Promotion'
    @department.deleted = false
    assert  @department.valid?
  end
end
