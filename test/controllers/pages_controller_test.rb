require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get guidelines" do
    get pages_guidelines_url
    assert_response :success
  end

  test "should get faq" do
    get pages_faq_url
    assert_response :success
  end

  test "should get lists" do
    get pages_lists_url
    assert_response :success
  end

  test "should get api" do
    get pages_api_url
    assert_response :success
  end

  test "should get security" do
    get pages_security_url
    assert_response :success
  end

  test "should get legal" do
    get pages_legal_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end
end
