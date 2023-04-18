require "test_helper"

class Admin::GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genre_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_genre_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_genre_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_genre_update_url
    assert_response :success
  end
end
