class Tqrdc::JobsController < ApplicationController
  before_action :set_tqrdc_job, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/jobs
  # GET /tqrdc/jobs.json
  def index
    @tqrdc_jobs = Tqrdc::Job.all.page
  end

  # GET /tqrdc/jobs/1
  # GET /tqrdc/jobs/1.json
  def show
  end

  # GET /tqrdc/jobs/new
  def new
    @tqrdc_job = Tqrdc::Job.new
  end

  # GET /tqrdc/jobs/1/edit
  def edit
  end

  # POST /tqrdc/jobs
  # POST /tqrdc/jobs.json
  def create
    @tqrdc_job = Tqrdc::Job.new(tqrdc_job_params)

    respond_to do |format|
      if @tqrdc_job.save
        format.html { redirect_to @tqrdc_job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_job }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/jobs/1
  # PATCH/PUT /tqrdc/jobs/1.json
  def update
    respond_to do |format|
      if @tqrdc_job.update(tqrdc_job_params)
        format.html { redirect_to @tqrdc_job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_job }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/jobs/1
  # DELETE /tqrdc/jobs/1.json
  def destroy
    @tqrdc_job.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_job
      @tqrdc_job = Tqrdc::Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_job_params
      params.require(:tqrdc_job).permit(:object_name, :objectid, :email, :job_owner, :job_params, :job_class, :job_action, :job_flag, :job_start_time, :job_run_time, :job_end_time, :comment)
    end
end
