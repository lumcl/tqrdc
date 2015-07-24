json.array!(@tqrdc_orders) do |tqrdc_order|
  json.extract! tqrdc_order, :id, :id, :supplier_id, :period, :status, :territory, :total
  json.url tqrdc_order_url(tqrdc_order, format: :json)
end
