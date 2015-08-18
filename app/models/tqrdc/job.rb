class Tqrdc::Job < ActiveRecord::Base

  def self.execute
    Tqrdc::Job.where(:job_flag => 'N').where('job_start_time <= ?', Time.now)
        .find_each(:batch_size => 500) do |job|
      begin
        job.job_run_time = Time.now
        ruby_class = (job.job_class).split('::').reduce(Object) { |cls, c| cls.const_get(c) }.new
        ruby_class.job = job
        ruby_class.method(job.job_action).call
        job.job_flag = 'Y'
        job.job_end_time = Time.now
        job.comment = 'Success'
      rescue Exception => e
        job.comment = "#{e}"
        Tqrdc::Job.error_notice(job.id, e)
      end
      job.save
    end
  end

  def self.error_notice(job_id, message)
    Mail.defaults do
      delivery_method :smtp, address: Figaro.env.mail_server, port: Figaro.env.mail_port
    end

    Mail.deliver do
      from Figaro.env.admin_email
      to Figaro.env.admin_email
      subject "TQRDC Job Id= #{job_id}, Message= #{message}"
      body "#{message}"
    end

  end

end
