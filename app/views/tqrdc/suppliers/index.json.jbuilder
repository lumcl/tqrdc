json.array!(@tqrdc_suppliers) do |tqrdc_supplier|
  json.extract! tqrdc_supplier, :id, :id, :supplier, :commodity_mgr_id, :start_period, :end_period
  json.url tqrdc_supplier_url(tqrdc_supplier, format: :json)
end
