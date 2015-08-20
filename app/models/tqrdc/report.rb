class Tqrdc::Report

  def self.order_summary(params)
    sql =
    "
      select a.id,a.period,a.territory,d.supplier lifnr, d.vname,d.mtype,a.total,b.group_id,c.name,to_char(c.description) description,c.score,b.total subtotal
       from tqrdc_order a
       join tqrdc_order_group b on b.order_id = a.id
       join tqrdc_group c on c.id = b.group_id
       join tqrdc_supplier d on d.id = a.supplier_id
      where a.seq = 5 and a.period like '%#{params[:period] || (Time.now - 1.month).strftime('%Y%m')}%'
        and a.territory like '%#{params[:territory] || ''}%'
        and d.supplier like '%#{params[:supplier] || ''}%'
        and d.mtype like '#{params[:mtype] || ''}%'
    "
    records = Tqrdc::Order.find_by_sql sql
    groups = {}
    orders = {}
    records.each do |row|
      order = orders[row.id] || {}
      order[:id] = row.id
      order[:period] = row.period
      order[:territory] = row.territory
      order[:lifnr] = row.lifnr
      order[:vname] = row.vname
      order[:mtype] = row.mtype
      order[:total] = row.total
      order[row.group_id] = row.subtotal
      orders[row.id] = order

      if groups[row.group_id].nil?
        group = {}
        group[:name] = row.name
        group[:description] = row.description
        groups[row.group_id] = group
      end
    end
    return orders, groups
  end

end