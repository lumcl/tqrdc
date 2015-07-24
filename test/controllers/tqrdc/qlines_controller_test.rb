require 'test_helper'

class Tqrdc::QlinesControllerTest < ActionController::TestCase
  setup do
    @tqrdc_qline = tqrdc_qline(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_qline)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_qline" do
    assert_difference('Tqrdc::Qline.count') do
      post :create, tqrdc_qline: { creator_id: @tqrdc_qline.creator_id, description: @tqrdc_qline.description, group_id: @tqrdc_qline.group_id, id: @tqrdc_qline.id, name: @tqrdc_qline.name, owner_id: @tqrdc_qline.owner_id, qhead_id: @tqrdc_qline.qhead_id, score: @tqrdc_qline.score, updater_id: @tqrdc_qline.updater_id }
    end

    assert_redirected_to tqrdc_qline_path(assigns(:tqrdc_qline))
  end

  test "should show tqrdc_qline" do
    get :show, id: @tqrdc_qline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_qline
    assert_response :success
  end

  test "should update tqrdc_qline" do
    patch :update, id: @tqrdc_qline, tqrdc_qline: { creator_id: @tqrdc_qline.creator_id, description: @tqrdc_qline.description, group_id: @tqrdc_qline.group_id, id: @tqrdc_qline.id, name: @tqrdc_qline.name, owner_id: @tqrdc_qline.owner_id, qhead_id: @tqrdc_qline.qhead_id, score: @tqrdc_qline.score, updater_id: @tqrdc_qline.updater_id }
    assert_redirected_to tqrdc_qline_path(assigns(:tqrdc_qline))
  end

  test "should destroy tqrdc_qline" do
    assert_difference('Tqrdc::Qline.count', -1) do
      delete :destroy, id: @tqrdc_qline
    end

    assert_redirected_to tqrdc_qlines_path
  end
end
