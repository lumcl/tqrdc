class Tqrdc::Email
  attr_accessor :job

  Mail.defaults do
    delivery_method :smtp, address: Figaro.env.mail_server, port: Figaro.env.mail_port
  end

  def self.reminder_list
    sql = "
      select distinct o.id,s.vname,s.supplier lifnr,o.territory,o.period,o.u1_user_id user_id, u.email, u.username from (
          select distinct a.id,a.supplier_id, a.period, a.territory, b.u1_user_id from tqrdc_order a
            join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
          where a.status <> 'CLOSE' and a.seq = 1
          union
          select distinct a.id,a.supplier_id, a.period, a.territory, b.u2_user_id from tqrdc_order a
            join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
          where a.status <> 'CLOSE' and a.seq = 2
          union
          select distinct a.id,a.supplier_id, a.period, a.territory, b.u3_user_id from tqrdc_order a
            join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
          where a.status <> 'CLOSE' and a.seq = 3
          union
          select distinct a.id,a.supplier_id, a.period, a.territory, b.u4_user_id from tqrdc_order a
            join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
          where a.status <> 'CLOSE' and a.seq = 4
      ) o
       join tqrdc_supplier s on s.id = o.supplier_id
       join users u on u.id = o.u1_user_id
    "
    users = {}
    list = Tqrdc::Order.find_by_sql sql
    list.each do |row|
      array = users[row.user_id] || []
      array.append row
      users[row.user_id] = array
    end

    users.keys.each do |user_id|
      html = "
        <html>
        <style>th,td{padding:'10px';}th{background-color:'#f8f8f8';}</style>
        <h3>請點選一下鏈接, 進行TQRDC評分:</h3>
        <table border='4' style='border-collapse: collapse;'
          <tr>
            <th></th>
            <th>#{I18n.translate('attributes.vname')}</th>
            <th>#{I18n.translate('attributes.supplier')}</th>
            <th>#{I18n.translate('attributes.territory')}</th>
            <th>#{I18n.translate('attributes.period')}</th>
            <th>#{I18n.translate('action')}</th>
          </tr>
      "
      i = 0
      users[user_id].sort_by(&:vname).each do |row|
        html = " #{html}
          <tr>
            <td>#{i += 1}</td>
            <td>#{row.vname}</td>
            <td>#{row.lifnr}</td>
            <td>#{row.territory}</td>
            <td>#{row.period}</td>
            <td>http://#{Figaro.env.http_server}/tqrdc/scores/#{row.id}/edit</td>
          </tr>
        "
      end
      html = " #{html}
        </table>

        <p><pre>tqrdc::app::models::Email#reminder_list</pre></p>
        <p>#{users[user_id].first.email}</p>
        </html>
      "
      Mail.deliver do
        from Figaro.env.admin_email
        #to users[user_id].first.email
        to 'jill.lin@l-e-i.com'
        subject 'TQRDC Reminder List 待簽核清单'

        html_part do
          content_type 'text/html; charset=UTF-8'
          body html
        end

      end

    end
  end

  def notice
    order = Tqrdc::Order.eager_load(:supplier, :order_lines).find job.objectid
    return if order.seq > 4

    email_list = []
    order.order_lines.each do |line|
      if order.seq == 1
        user_id = line.u1_user_id
      elsif order.seq == 2
        user_id = line.u2_user_id
      elsif order.seq == 3
        user_id = line.u3_user_id
      elsif order.seq == 4
        user_id = line.u4_user_id
      end
      email_list.append user_id unless email_list.include?(user_id)
    end

    return if email_list.blank?

    url = "http://#{Figaro.env.http_server}/tqrdc/scores/#{order.id}/edit"

    from = job.job_owner
    to = User.where(id: email_list).pluck(:email).join(',')

    Mail.deliver do
      from from
      #to to
      to 'jill.lin@l-e-i.com'
      subject "TQRDC #{order.supplier.name} #{order.territory} #{order.period} 待簽核"
      body "\n
            Please click below link for approval \n
            請點擊以下鏈接進行審核 \n
           #{url}
           \n
           \n
            tqrdc::app::models::Email#notice

            #{to}
           "
    end


  end

end