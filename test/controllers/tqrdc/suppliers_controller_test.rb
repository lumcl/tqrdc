require 'test_helper'

class Tqrdc::SuppliersControllerTest < ActionController::TestCase
  setup do
    @tqrdc_supplier = tqrdc_supplier(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_supplier)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_supplier" do
    assert_difference('Tqrdc::Supplier.count') do
      post :create, tqrdc_supplier: { commodity_mgr_id: @tqrdc_supplier.commodity_mgr_id, end_period: @tqrdc_supplier.end_period, id: @tqrdc_supplier.id, start_period: @tqrdc_supplier.start_period, supplier: @tqrdc_supplier.supplier }
    end

    assert_redirected_to tqrdc_supplier_path(assigns(:tqrdc_supplier))
  end

  test "should show tqrdc_supplier" do
    get :show, id: @tqrdc_supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_supplier
    assert_response :success
  end

  test "should update tqrdc_supplier" do
    patch :update, id: @tqrdc_supplier, tqrdc_supplier: { commodity_mgr_id: @tqrdc_supplier.commodity_mgr_id, end_period: @tqrdc_supplier.end_period, id: @tqrdc_supplier.id, start_period: @tqrdc_supplier.start_period, supplier: @tqrdc_supplier.supplier }
    assert_redirected_to tqrdc_supplier_path(assigns(:tqrdc_supplier))
  end

  test "should destroy tqrdc_supplier" do
    assert_difference('Tqrdc::Supplier.count', -1) do
      delete :destroy, id: @tqrdc_supplier
    end

    assert_redirected_to tqrdc_suppliers_path
  end
end
