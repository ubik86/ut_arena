require 'test_helper'

class ImportGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get import_games_new_url
    assert_response :success
  end

  test "should get create" do
    get import_games_create_url
    assert_response :success
  end

end
