class Tqrdc::OrderFilesController < ApplicationController
  before_action :set_tqrdc_order_file, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/order_files
  # GET /tqrdc/order_files.json
  def index
    @tqrdc_order_files = Tqrdc::OrderFile.all
  end

  # GET /tqrdc/order_files/1
  # GET /tqrdc/order_files/1.json
  def show
  end

  # GET /tqrdc/order_files/new
  def new
    @tqrdc_order_file = Tqrdc::OrderFile.new
  end

  # GET /tqrdc/order_files/1/edit
  def edit
  end

  # POST /tqrdc/order_files
  # POST /tqrdc/order_files.json
  def create
    @tqrdc_order_file = Tqrdc::OrderFile.new(tqrdc_order_file_params)

    respond_to do |format|
      if @tqrdc_order_file.save
        format.html { redirect_to @tqrdc_order_file, notice: 'Order file was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_order_file }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_order_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/order_files/1
  # PATCH/PUT /tqrdc/order_files/1.json
  def update
    respond_to do |format|
      if @tqrdc_order_file.update(tqrdc_order_file_params)
        format.html { redirect_to @tqrdc_order_file, notice: 'Order file was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_order_file }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_order_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/order_files/1
  # DELETE /tqrdc/order_files/1.json
  def destroy
    @tqrdc_order_file.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_order_files_url, notice: 'Order file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_order_file
      @tqrdc_order_file = Tqrdc::OrderFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_order_file_params
      params.require(:tqrdc_order_file).permit(:order_id, :filename, :tqrdc, :remark, :owner_id, :creator_id, :updater_id)
    end
end
