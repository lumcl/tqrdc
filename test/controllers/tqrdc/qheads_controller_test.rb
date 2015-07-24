require 'test_helper'

class Tqrdc::QheadsControllerTest < ActionController::TestCase
  setup do
    @tqrdc_qhead = tqrdc_qhead(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_qhead)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_qhead" do
    assert_difference('Tqrdc::Qhead.count') do
      post :create, tqrdc_qhead: { creator_id: @tqrdc_qhead.creator_id, description: @tqrdc_qhead.description, group_id: @tqrdc_qhead.group_id, id: @tqrdc_qhead.id, name: @tqrdc_qhead.name, owner_id: @tqrdc_qhead.owner_id, remark: @tqrdc_qhead.remark, score: @tqrdc_qhead.score, updater_id: @tqrdc_qhead.updater_id }
    end

    assert_redirected_to tqrdc_qhead_path(assigns(:tqrdc_qhead))
  end

  test "should show tqrdc_qhead" do
    get :show, id: @tqrdc_qhead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_qhead
    assert_response :success
  end

  test "should update tqrdc_qhead" do
    patch :update, id: @tqrdc_qhead, tqrdc_qhead: { creator_id: @tqrdc_qhead.creator_id, description: @tqrdc_qhead.description, group_id: @tqrdc_qhead.group_id, id: @tqrdc_qhead.id, name: @tqrdc_qhead.name, owner_id: @tqrdc_qhead.owner_id, remark: @tqrdc_qhead.remark, score: @tqrdc_qhead.score, updater_id: @tqrdc_qhead.updater_id }
    assert_redirected_to tqrdc_qhead_path(assigns(:tqrdc_qhead))
  end

  test "should destroy tqrdc_qhead" do
    assert_difference('Tqrdc::Qhead.count', -1) do
      delete :destroy, id: @tqrdc_qhead
    end

    assert_redirected_to tqrdc_qheads_path
  end
end
