class Tqrdc::Email
  attr_accessor :job

  Mail.defaults do
    delivery_method :smtp, address: Figaro.env.mail_server, port: Figaro.env.mail_port
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