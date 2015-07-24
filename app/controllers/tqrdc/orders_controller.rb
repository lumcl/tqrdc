class Tqrdc::OrdersController < ApplicationController
  before_action :set_tqrdc_order, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/orders
  # GET /tqrdc/orders.json
  def index
    @tqrdc_orders = Tqrdc::Order.all.page
  end

  # GET /tqrdc/orders/1
  # GET /tqrdc/orders/1.json
  def show
  end

  # GET /tqrdc/orders/new
  def new
    @tqrdc_order = Tqrdc::Order.new
  end

  # GET /tqrdc/orders/1/edit
  def edit
  end

  # POST /tqrdc/orders
  # POST /tqrdc/orders.json
  def create
    @tqrdc_order = Tqrdc::Order.new(tqrdc_order_params)

    respond_to do |format|
      if @tqrdc_order.save
        format.html { redirect_to @tqrdc_order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_order }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/orders/1
  # PATCH/PUT /tqrdc/orders/1.json
  def update
    respond_to do |format|
      if @tqrdc_order.update(tqrdc_order_params)
        format.html { redirect_to @tqrdc_order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_order }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/orders/1
  # DELETE /tqrdc/orders/1.json
  def destroy
    @tqrdc_order.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_order
      @tqrdc_order = Tqrdc::Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_order_params
      params.require(:tqrdc_order).permit(:id, :supplier_id, :period, :status, :territory, :total)
    end
end
