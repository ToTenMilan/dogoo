require "test_helper"

class Searches::DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get searches_dogs_index_url
    assert_response :success
  end
end
