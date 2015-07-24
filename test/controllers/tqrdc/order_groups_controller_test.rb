require 'test_helper'

class Tqrdc::OrderGroupsControllerTest < ActionController::TestCase
  setup do
    @tqrdc_order_group = tqrdc_order_group(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_order_group)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_order_group" do
    assert_difference('Tqrdc::OrderGroup.count') do
      post :create, tqrdc_order_group: { group_id: @tqrdc_order_group.group_id, id: @tqrdc_order_group.id, order_id: @tqrdc_order_group.order_id, status: @tqrdc_order_group.status, total: @tqrdc_order_group.total }
    end

    assert_redirected_to tqrdc_order_group_path(assigns(:tqrdc_order_group))
  end

  test "should show tqrdc_order_group" do
    get :show, id: @tqrdc_order_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_order_group
    assert_response :success
  end

  test "should update tqrdc_order_group" do
    patch :update, id: @tqrdc_order_group, tqrdc_order_group: { group_id: @tqrdc_order_group.group_id, id: @tqrdc_order_group.id, order_id: @tqrdc_order_group.order_id, status: @tqrdc_order_group.status, total: @tqrdc_order_group.total }
    assert_redirected_to tqrdc_order_group_path(assigns(:tqrdc_order_group))
  end

  test "should destroy tqrdc_order_group" do
    assert_difference('Tqrdc::OrderGroup.count', -1) do
      delete :destroy, id: @tqrdc_order_group
    end

    assert_redirected_to tqrdc_order_groups_path
  end
end
