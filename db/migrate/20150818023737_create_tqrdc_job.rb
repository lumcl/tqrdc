class CreateTqrdcJob < ActiveRecord::Migration
  def change
    create_table :tqrdc_job do |t|
      t.text :object_name
      t.integer :objectid
      t.text :email
      t.string :job_owner
      t.string :job_params
      t.string :job_class
      t.string :job_action
      t.string :job_flag
      t.datetime :job_start_time
      t.datetime :job_run_time
      t.datetime :job_end_time
      t.text :comment

      t.timestamps null: false
    end
  end
end
