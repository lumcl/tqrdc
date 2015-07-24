json.array!(@tqrdc_order_lines) do |tqrdc_order_line|
  json.extract! tqrdc_order_line, :id, :id, :order_id, :order_group_id, :status, :qhead_id, :final_score, :u1_score, :u1_user_id, :u1_comment, :u1_sign_date, :u1_ip, :u1_role, :u1_qline_id, :u2_score, :u2_user_id, :u2_comment, :u2_sign_date, :u2_ip, :u2_role, :u2_qline_id, :u3_score, :u3_user_id, :u3_comment, :u3_sign_date, :u3_ip, :u3_role, :u3_qline_id, :u4_score, :u4_user_id, :u4_comment, :u4_sign_date, :u4_ip, :u4_role, :u4_qline_id
  json.url tqrdc_order_line_url(tqrdc_order_line, format: :json)
end
