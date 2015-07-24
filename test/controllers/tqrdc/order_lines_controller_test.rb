require 'test_helper'

class Tqrdc::OrderLinesControllerTest < ActionController::TestCase
  setup do
    @tqrdc_order_line = tqrdc_order_line(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_order_line)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_order_line" do
    assert_difference('Tqrdc::OrderLine.count') do
      post :create, tqrdc_order_line: { final_score: @tqrdc_order_line.final_score, id: @tqrdc_order_line.id, order_group_id: @tqrdc_order_line.order_group_id, order_id: @tqrdc_order_line.order_id, qhead_id: @tqrdc_order_line.qhead_id, status: @tqrdc_order_line.status, u1_comment: @tqrdc_order_line.u1_comment, u1_ip: @tqrdc_order_line.u1_ip, u1_qline_id: @tqrdc_order_line.u1_qline_id, u1_role: @tqrdc_order_line.u1_role, u1_score: @tqrdc_order_line.u1_score, u1_sign_date: @tqrdc_order_line.u1_sign_date, u1_user_id: @tqrdc_order_line.u1_user_id, u2_comment: @tqrdc_order_line.u2_comment, u2_ip: @tqrdc_order_line.u2_ip, u2_qline_id: @tqrdc_order_line.u2_qline_id, u2_role: @tqrdc_order_line.u2_role, u2_score: @tqrdc_order_line.u2_score, u2_sign_date: @tqrdc_order_line.u2_sign_date, u2_user_id: @tqrdc_order_line.u2_user_id, u3_comment: @tqrdc_order_line.u3_comment, u3_ip: @tqrdc_order_line.u3_ip, u3_qline_id: @tqrdc_order_line.u3_qline_id, u3_role: @tqrdc_order_line.u3_role, u3_score: @tqrdc_order_line.u3_score, u3_sign_date: @tqrdc_order_line.u3_sign_date, u3_user_id: @tqrdc_order_line.u3_user_id, u4_comment: @tqrdc_order_line.u4_comment, u4_ip: @tqrdc_order_line.u4_ip, u4_qline_id: @tqrdc_order_line.u4_qline_id, u4_role: @tqrdc_order_line.u4_role, u4_score: @tqrdc_order_line.u4_score, u4_sign_date: @tqrdc_order_line.u4_sign_date, u4_user_id: @tqrdc_order_line.u4_user_id }
    end

    assert_redirected_to tqrdc_order_line_path(assigns(:tqrdc_order_line))
  end

  test "should show tqrdc_order_line" do
    get :show, id: @tqrdc_order_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_order_line
    assert_response :success
  end

  test "should update tqrdc_order_line" do
    patch :update, id: @tqrdc_order_line, tqrdc_order_line: { final_score: @tqrdc_order_line.final_score, id: @tqrdc_order_line.id, order_group_id: @tqrdc_order_line.order_group_id, order_id: @tqrdc_order_line.order_id, qhead_id: @tqrdc_order_line.qhead_id, status: @tqrdc_order_line.status, u1_comment: @tqrdc_order_line.u1_comment, u1_ip: @tqrdc_order_line.u1_ip, u1_qline_id: @tqrdc_order_line.u1_qline_id, u1_role: @tqrdc_order_line.u1_role, u1_score: @tqrdc_order_line.u1_score, u1_sign_date: @tqrdc_order_line.u1_sign_date, u1_user_id: @tqrdc_order_line.u1_user_id, u2_comment: @tqrdc_order_line.u2_comment, u2_ip: @tqrdc_order_line.u2_ip, u2_qline_id: @tqrdc_order_line.u2_qline_id, u2_role: @tqrdc_order_line.u2_role, u2_score: @tqrdc_order_line.u2_score, u2_sign_date: @tqrdc_order_line.u2_sign_date, u2_user_id: @tqrdc_order_line.u2_user_id, u3_comment: @tqrdc_order_line.u3_comment, u3_ip: @tqrdc_order_line.u3_ip, u3_qline_id: @tqrdc_order_line.u3_qline_id, u3_role: @tqrdc_order_line.u3_role, u3_score: @tqrdc_order_line.u3_score, u3_sign_date: @tqrdc_order_line.u3_sign_date, u3_user_id: @tqrdc_order_line.u3_user_id, u4_comment: @tqrdc_order_line.u4_comment, u4_ip: @tqrdc_order_line.u4_ip, u4_qline_id: @tqrdc_order_line.u4_qline_id, u4_role: @tqrdc_order_line.u4_role, u4_score: @tqrdc_order_line.u4_score, u4_sign_date: @tqrdc_order_line.u4_sign_date, u4_user_id: @tqrdc_order_line.u4_user_id }
    assert_redirected_to tqrdc_order_line_path(assigns(:tqrdc_order_line))
  end

  test "should destroy tqrdc_order_line" do
    assert_difference('Tqrdc::OrderLine.count', -1) do
      delete :destroy, id: @tqrdc_order_line
    end

    assert_redirected_to tqrdc_order_lines_path
  end
end
