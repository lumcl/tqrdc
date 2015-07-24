json.array!(@tqrdc_qlines) do |tqrdc_qline|
  json.extract! tqrdc_qline, :id, :id, :name, :description, :group_id, :score, :qhead_id, :owner_id, :creator_id, :updater_id
  json.url tqrdc_qline_url(tqrdc_qline, format: :json)
end
