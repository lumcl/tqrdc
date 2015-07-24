require 'test_helper'

class Tqrdc::FlowsControllerTest < ActionController::TestCase
  setup do
    @tqrdc_flow = tqrdc_flow(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_flow)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_flow" do
    assert_difference('Tqrdc::Flow.count') do
      post :create, tqrdc_flow: { creator_id: @tqrdc_flow.creator_id, description: @tqrdc_flow.description, id: @tqrdc_flow.id, name: @tqrdc_flow.name, next_seq: @tqrdc_flow.next_seq, owner_id: @tqrdc_flow.owner_id, qhead_id: @tqrdc_flow.qhead_id, role: @tqrdc_flow.role, seq: @tqrdc_flow.seq, territory: @tqrdc_flow.territory, updater_id: @tqrdc_flow.updater_id, user_id: @tqrdc_flow.user_id }
    end

    assert_redirected_to tqrdc_flow_path(assigns(:tqrdc_flow))
  end

  test "should show tqrdc_flow" do
    get :show, id: @tqrdc_flow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_flow
    assert_response :success
  end

  test "should update tqrdc_flow" do
    patch :update, id: @tqrdc_flow, tqrdc_flow: { creator_id: @tqrdc_flow.creator_id, description: @tqrdc_flow.description, id: @tqrdc_flow.id, name: @tqrdc_flow.name, next_seq: @tqrdc_flow.next_seq, owner_id: @tqrdc_flow.owner_id, qhead_id: @tqrdc_flow.qhead_id, role: @tqrdc_flow.role, seq: @tqrdc_flow.seq, territory: @tqrdc_flow.territory, updater_id: @tqrdc_flow.updater_id, user_id: @tqrdc_flow.user_id }
    assert_redirected_to tqrdc_flow_path(assigns(:tqrdc_flow))
  end

  test "should destroy tqrdc_flow" do
    assert_difference('Tqrdc::Flow.count', -1) do
      delete :destroy, id: @tqrdc_flow
    end

    assert_redirected_to tqrdc_flows_path
  end
end
