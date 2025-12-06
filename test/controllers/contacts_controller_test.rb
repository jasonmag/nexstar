require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    post contacts_url, params: {
      contact: {
        name: "Test User",
        email: "test@example.com",
        message: "Hello from test"
      }
    }

    # Your controller likely redirects with a flash after successful create
    assert_response :redirect
    # If you know the exact redirect, you can be stricter, e.g.:
    # assert_redirected_to root_url
  end
end
