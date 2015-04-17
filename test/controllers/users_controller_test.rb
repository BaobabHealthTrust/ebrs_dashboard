require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { active: @user.active, create_at: @user.create_at, creator: @user.creator, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, notify: @user.notify, password_hash: @user.password_hash, role: @user.role, updated_at: @user.updated_at }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { active: @user.active, create_at: @user.create_at, creator: @user.creator, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, notify: @user.notify, password_hash: @user.password_hash, role: @user.role, updated_at: @user.updated_at }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
