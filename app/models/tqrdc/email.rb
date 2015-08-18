class Tqrdc::Email

  Mail.defaults do
    delivery_method :smtp, address: Figaro.env.mail_server, port: Figaro.env.mail_port
  end

  def self.notice(job)
    order = Tqrdc::Order.eager_load(:supplier).find job.object_id
    url = "http://#{Figaro.env.http_server}/tqrdc/scores/#{order.id}/edit"

    Mail.deliver do
      from job.owner
      to job.email
      subject "TQRDC #{order.supplier.name} #{order.territory} #{order.period} 待簽核"
      body "Please click below link for approval \n
            請點擊以下鏈接進行審核 \n
            #{url}
            \n
            \n
            tqrdc::app::models::Email#notice
           "
    end

  end

end