class Tqrdc::QlinesController < ApplicationController
  before_action :set_tqrdc_qline, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/qlines
  # GET /tqrdc/qlines.json
  def index
    @tqrdc_qlines = Tqrdc::Qline.all.order(:id).page params[:page]
  end

  # GET /tqrdc/qlines/1
  # GET /tqrdc/qlines/1.json
  def show
  end

  # GET /tqrdc/qlines/new
  def new
    @tqrdc_qline = Tqrdc::Qline.new
    @tqrdc_qline.owner_id = current_user.id
    @tqrdc_qline.creator_id = current_user.id
    @tqrdc_qline.updater_id = current_user.id
  end

  # GET /tqrdc/qlines/1/edit
  def edit
    @tqrdc_qline.updater_id = current_user.id
  end

  # POST /tqrdc/qlines
  # POST /tqrdc/qlines.json
  def create
    @tqrdc_qline = Tqrdc::Qline.new(tqrdc_qline_params)

    respond_to do |format|
      if @tqrdc_qline.save
        format.html { redirect_to @tqrdc_qline, notice: 'Qline was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_qline }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_qline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/qlines/1
  # PATCH/PUT /tqrdc/qlines/1.json
  def update
    respond_to do |format|
      if @tqrdc_qline.update(tqrdc_qline_params)
        format.html { redirect_to @tqrdc_qline, notice: 'Qline was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_qline }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_qline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/qlines/1
  # DELETE /tqrdc/qlines/1.json
  def destroy
    @tqrdc_qline.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_qlines_url, notice: 'Qline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_qline
      @tqrdc_qline = Tqrdc::Qline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_qline_params
      params.require(:tqrdc_qline).permit(:id, :name, :description, :group_id, :score, :qhead_id, :owner_id, :creator_id, :updater_id)
    end
end
