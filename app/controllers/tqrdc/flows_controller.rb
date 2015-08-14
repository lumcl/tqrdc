class Tqrdc::FlowsController < ApplicationController
  before_action :set_tqrdc_flow, only: [:show, :edit, :update, :destroy]
  # GET /tqrdc/flows
  # GET /tqrdc/flows.json
  def index
    #@tqrdc_flows = Tqrdc::Flow.all.page #有分頁按鈕，但是沒有作用
    @tqrdc_flows = Tqrdc::Flow.all.order(:id).page params[:page]
  end

  # GET /tqrdc/flows/1
  # GET /tqrdc/flows/1.json
  def show
  end

  # GET /tqrdc/flows/new
  def new
    @tqrdc_flow = Tqrdc::Flow.new
    @tqrdc_flow.owner_id = current_user.id
    @tqrdc_flow.creator_id = current_user.id
    @tqrdc_flow.updater_id = current_user.id
  end

  # GET /tqrdc/flows/1/edit
  def edit
    @tqrdc_flow.updater_id = current_user.id
  end

  # POST /tqrdc/flows
  # POST /tqrdc/flows.json
  def create
    @tqrdc_flow = Tqrdc::Flow.new(tqrdc_flow_params)

    respond_to do |format|
      if @tqrdc_flow.save
        format.html { redirect_to @tqrdc_flow, notice: 'Flow was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_flow }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/flows/1
  # PATCH/PUT /tqrdc/flows/1.json
  def update
    respond_to do |format|
      if @tqrdc_flow.update(tqrdc_flow_params)
        format.html { redirect_to @tqrdc_flow, notice: 'Flow was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_flow }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/flows/1
  # DELETE /tqrdc/flows/1.json
  def destroy
    @tqrdc_flow.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_flows_url, notice: 'Flow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_flow
      @tqrdc_flow = Tqrdc::Flow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_flow_params
      params.require(:tqrdc_flow).permit(:id, :name, :description, :qhead_id, :role, :territory, :user_id, :seq, :next_seq, :owner_id, :creator_id, :updater_id)
    end
end
