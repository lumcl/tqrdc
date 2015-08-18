json.array!(@tqrdc_jobs) do |tqrdc_job|
  json.extract! tqrdc_job, :id, :object_name, :object_id, :email, :job_owner, :job_params, :job_class, :job_action, :job_flag, :job_start_time, :job_run_time, :job_end_time, :comment
  json.url tqrdc_job_url(tqrdc_job, format: :json)
end
