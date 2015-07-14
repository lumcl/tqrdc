json.array!(@tqrdc_groups) do |tqrdc_group|
  json.extract! tqrdc_group, :id, :id, :name, :description, :score, :owner_id, :creator_id, :updater_id
  json.url tqrdc_group_url(tqrdc_group, format: :json)
end
