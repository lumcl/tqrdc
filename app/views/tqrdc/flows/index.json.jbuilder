json.array!(@tqrdc_flows) do |tqrdc_flow|
  json.extract! tqrdc_flow, :id, :id, :name, :description, :qhead_id, :role, :territory, :user_id, :seq, :next_seq, :owner_id, :creator_id, :updater_id
  json.url tqrdc_flow_url(tqrdc_flow, format: :json)
end
