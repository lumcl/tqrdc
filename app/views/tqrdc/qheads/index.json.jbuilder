json.array!(@tqrdc_qheads) do |tqrdc_qhead|
  json.extract! tqrdc_qhead, :id, :id, :name, :description, :group_id, :score, :remark, :owner_id, :creator_id, :updater_id
  json.url tqrdc_qhead_url(tqrdc_qhead, format: :json)
end
