require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get skills_index_url
    assert_response :success
  end

  test "should get new" do
    get skills_new_url
    assert_response :success
  end

  test "should get edit" do
    get skills_edit_url
    assert_response :success
  end

end
