require "test_helper"

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipe_foods_index_url
    assert_response :success
  end

  test "should get show" do
    get recipe_foods_show_url
    assert_response :success
  end
end
