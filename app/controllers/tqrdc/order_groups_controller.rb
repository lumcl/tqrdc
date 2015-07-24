class Tqrdc::OrderGroupsController < ApplicationController
  before_action :set_tqrdc_order_group, only: [:show, :edit, :update, :destroy]

  # GET /tqrdc/order_groups
  # GET /tqrdc/order_groups.json
  def index
    @tqrdc_order_groups = Tqrdc::OrderGroup.all.page
  end

  # GET /tqrdc/order_groups/1
  # GET /tqrdc/order_groups/1.json
  def show
  end

  # GET /tqrdc/order_groups/new
  def new
    @tqrdc_order_group = Tqrdc::OrderGroup.new
  end

  # GET /tqrdc/order_groups/1/edit
  def edit
  end

  # POST /tqrdc/order_groups
  # POST /tqrdc/order_groups.json
  def create
    @tqrdc_order_group = Tqrdc::OrderGroup.new(tqrdc_order_group_params)

    respond_to do |format|
      if @tqrdc_order_group.save
        format.html { redirect_to @tqrdc_order_group, notice: 'Order group was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_order_group }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_order_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/order_groups/1
  # PATCH/PUT /tqrdc/order_groups/1.json
  def update
    respond_to do |format|
      if @tqrdc_order_group.update(tqrdc_order_group_params)
        format.html { redirect_to @tqrdc_order_group, notice: 'Order group was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_order_group }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_order_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/order_groups/1
  # DELETE /tqrdc/order_groups/1.json
  def destroy
    @tqrdc_order_group.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_order_groups_url, notice: 'Order group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_order_group
      @tqrdc_order_group = Tqrdc::OrderGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_order_group_params
      params.require(:tqrdc_order_group).permit(:id, :order_id, :group_id, :status, :total)
    end
end
