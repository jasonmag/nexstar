require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    skip "Contact create behavior not finalized yet"

    post contacts_url, params: {
      contact: {
        name: "Test User",
        email: "test@example.com",
        message: "Hello from test"
      }
    }

    assert_response :redirect
  end
end
