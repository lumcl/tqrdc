json.array!(@tqrdc_order_groups) do |tqrdc_order_group|
  json.extract! tqrdc_order_group, :id, :id, :order_id, :group_id, :status, :total
  json.url tqrdc_order_group_url(tqrdc_order_group, format: :json)
end
