json.array!(@tqrdc_order_files) do |tqrdc_order_file|
  json.extract! tqrdc_order_file, :id, :order_id, :filename, :tqrdc, :remark, :owner_id, :creator_id, :updater_id
  json.url tqrdc_order_file_url(tqrdc_order_file, format: :json)
end
