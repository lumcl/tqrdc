class Tqrdc::QheadsController < ApplicationController
  before_action :set_tqrdc_qhead, only: [:show, :edit, :update, :destroy]


  # GET /tqrdc/qheads
  # GET /tqrdc/qheads.json
  def index
    @tqrdc_qheads = Tqrdc::Qhead.all.page
  end

  # GET /tqrdc/qheads/1
  # GET /tqrdc/qheads/1.json
  def show
  end

  # GET /tqrdc/qheads/new
  def new
    @tqrdc_qhead = Tqrdc::Qhead.new
    @tqrdc_qhead.owner_id = current_user.id
    @tqrdc_qhead.creator_id = current_user.id
    @tqrdc_qhead.updater_id = current_user.id
  end

  # GET /tqrdc/qheads/1/edit
  def edit
    @tqrdc_qhead.updater_id = current_user.id

  end

  # POST /tqrdc/qheads
  # POST /tqrdc/qheads.json
  def create
    @tqrdc_qhead = Tqrdc::Qhead.new(tqrdc_qhead_params)

    respond_to do |format|
      if @tqrdc_qhead.save
        format.html { redirect_to @tqrdc_qhead, notice: 'Qhead was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_qhead }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_qhead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/qheads/1
  # PATCH/PUT /tqrdc/qheads/1.json
  def update
    respond_to do |format|
      if @tqrdc_qhead.update(tqrdc_qhead_params)
        format.html { redirect_to @tqrdc_qhead, notice: 'Qhead was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_qhead }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_qhead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/qheads/1
  # DELETE /tqrdc/qheads/1.json
  def destroy
    @tqrdc_qhead.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_qheads_url, notice: 'Qhead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_qhead
      @tqrdc_qhead = Tqrdc::Qhead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_qhead_params
      params.require(:tqrdc_qhead).permit(:id, :name, :description, :group_id, :score, :remark, :owner_id, :creator_id, :updater_id)
    end
end
