require 'test_helper'

class EmailSubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_subscriber = email_subscribers(:one)
  end

  test "should get index" do
    get email_subscribers_url
    assert_response :success
  end

  test "should get new" do
    get new_email_subscriber_url
    assert_response :success
  end

  test "should create email_subscriber" do
    assert_difference('EmailSubscriber.count') do
      post email_subscribers_url, params: { email_subscriber: { email: @email_subscriber.email, list_name: @email_subscriber.list_name, name: @email_subscriber.name } }
    end

    assert_redirected_to email_subscriber_url(EmailSubscriber.last)
  end

  test "should show email_subscriber" do
    get email_subscriber_url(@email_subscriber)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_subscriber_url(@email_subscriber)
    assert_response :success
  end

  test "should update email_subscriber" do
    patch email_subscriber_url(@email_subscriber), params: { email_subscriber: { email: @email_subscriber.email, list_name: @email_subscriber.list_name, name: @email_subscriber.name } }
    assert_redirected_to email_subscriber_url(@email_subscriber)
  end

  test "should destroy email_subscriber" do
    assert_difference('EmailSubscriber.count', -1) do
      delete email_subscriber_url(@email_subscriber)
    end

    assert_redirected_to email_subscribers_url
  end
end
