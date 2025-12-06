require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should redirect index when not logged in" do
    get admin_users_url
    assert_redirected_to new_user_session_url
  end

  test "show not implemented yet" do
    skip "Show action/route not finalized yet"
  end

  test "new not implemented yet" do
    skip "New action/route not finalized yet"
  end

  test "create not implemented yet" do
    skip "Create action/route not finalized yet"
  end

  test "edit not implemented yet" do
    skip "Edit action/route not finalized yet"
  end

  test "update not implemented yet" do
    skip "Update action/route not finalized yet"
  end

  test "destroy not implemented yet" do
    skip "Destroy action/route not finalized yet"
  end
end
