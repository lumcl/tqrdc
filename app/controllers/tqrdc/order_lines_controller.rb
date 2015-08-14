class Tqrdc::OrderLinesController < ApplicationController
  before_action :set_tqrdc_order_line, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/order_lines
  # GET /tqrdc/order_lines.json
  def index

    @tqrdc_order_lines = Tqrdc::OrderLine.all.page
  end

  # GET /tqrdc/order_lines/1
  # GET /tqrdc/order_lines/1.json
  def show
  end

  # GET /tqrdc/order_lines/new
  def new
    @tqrdc_order_line = Tqrdc::OrderLine.new

  end

  # GET /tqrdc/order_lines/1/edit
  def edit

  end

  # POST /tqrdc/order_lines
  # POST /tqrdc/order_lines.json
  def create
    @tqrdc_order_line = Tqrdc::OrderLine.new(tqrdc_order_line_params)

    respond_to do |format|
      if @tqrdc_order_line.save
        format.html { redirect_to @tqrdc_order_line, notice: 'Order line was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_order_line }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/order_lines/1
  # PATCH/PUT /tqrdc/order_lines/1.json
  def update
    respond_to do |format|
      if @tqrdc_order_line.update(tqrdc_order_line_params)
        format.html { redirect_to @tqrdc_order_line, notice: 'Order line was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_order_line }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/order_lines/1
  # DELETE /tqrdc/order_lines/1.json
  def destroy
    @tqrdc_order_line.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_order_lines_url, notice: 'Order line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_order_line
      @tqrdc_order_line = Tqrdc::OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_order_line_params
      params.require(:tqrdc_order_line).permit(:id, :order_id, :order_group_id, :status, :qhead_id, :final_score, :u1_score, :u1_user_id, :u1_comment, :u1_sign_date, :u1_ip, :u1_role, :u1_qline_id, :u2_score, :u2_user_id, :u2_comment, :u2_sign_date, :u2_ip, :u2_role, :u2_qline_id, :u3_score, :u3_user_id, :u3_comment, :u3_sign_date, :u3_ip, :u3_role, :u3_qline_id, :u4_score, :u4_user_id, :u4_comment, :u4_sign_date, :u4_ip, :u4_role, :u4_qline_id , :seq)
    end
end
