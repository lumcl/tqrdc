require 'test_helper'

class Tqrdc::OrdersControllerTest < ActionController::TestCase
  setup do
    @tqrdc_order = tqrdc_order(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_order)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_order" do
    assert_difference('Tqrdc::Order.count') do
      post :create, tqrdc_order: { id: @tqrdc_order.id, period: @tqrdc_order.period, status: @tqrdc_order.status, supplier_id: @tqrdc_order.supplier_id, territory: @tqrdc_order.territory, total: @tqrdc_order.total }
    end

    assert_redirected_to tqrdc_order_path(assigns(:tqrdc_order))
  end

  test "should show tqrdc_order" do
    get :show, id: @tqrdc_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_order
    assert_response :success
  end

  test "should update tqrdc_order" do
    patch :update, id: @tqrdc_order, tqrdc_order: { id: @tqrdc_order.id, period: @tqrdc_order.period, status: @tqrdc_order.status, supplier_id: @tqrdc_order.supplier_id, territory: @tqrdc_order.territory, total: @tqrdc_order.total }
    assert_redirected_to tqrdc_order_path(assigns(:tqrdc_order))
  end

  test "should destroy tqrdc_order" do
    assert_difference('Tqrdc::Order.count', -1) do
      delete :destroy, id: @tqrdc_order
    end

    assert_redirected_to tqrdc_orders_path
  end
end
