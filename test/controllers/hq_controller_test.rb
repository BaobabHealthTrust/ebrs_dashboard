require 'test_helper'

class HqControllerTest < ActionController::TestCase
  test "should get re_open_case" do
    get :re_open_case
    assert_response :success
  end

  test "should get close_cases" do
    get :close_cases
    assert_response :success
  end

  test "should get void_cases" do
    get :void_cases
    assert_response :success
  end

  test "should get view_cases" do
    get :view_cases
    assert_response :success
  end

  test "should get view_closed_cases" do
    get :view_closed_cases
    assert_response :success
  end

  test "should get view_requests" do
    get :view_requests
    assert_response :success
  end

  test "should get manage_duplicates" do
    get :manage_duplicates
    assert_response :success
  end

  test "should get reports" do
    get :reports
    assert_response :success
  end

  test "should get print_certificates" do
    get :print_certificates
    assert_response :success
  end

  test "should get list_voided_cases" do
    get :list_voided_cases
    assert_response :success
  end

  test "should get manage_sites" do
    get :manage_sites
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
