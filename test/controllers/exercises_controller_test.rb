require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get exercises_update_url
    assert_response :success
  end

end
